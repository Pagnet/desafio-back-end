class TransactionImportJob < ApplicationJob
  queue_as :default

  def perform(line)
    cnab_data = CnabAdapter.adapt(line)
    store_data = StoreAdapter.adapt_from_cnab(cnab_data)
    transaction_data = TransactionAdapter.adapt_from_cnab(cnab_data)

    ActiveRecord::Base.transaction do
      store = store_exists?(store_data) ? find_store(store_data) : create_store(store_data)

      transaction_data[:store_id] = store.id

      create_transaction(transaction_data) unless transaction_exists?(transaction_data)
    end
  end


  def store_exists?(store_data)
    store_scope(store_data).exists?
  end

  def find_store(store_data)
    store_scope(store_data).first
  end

  def store_scope(store_data)
    Store.where(name: store_data[:name])
  end

  def create_store(store_data)
    Store.create(store_data)
  end

  def transaction_exists?(transaction_data)
    transaction_scope(transaction_data).exists?
  end

  def transaction_scope(transaction_data)
    Transaction.where(**transaction_data)
  end

end
