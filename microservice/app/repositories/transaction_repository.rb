class TransactionRepository
  def self.all_with_relations
    Transaction
      .joins(:transaction_type)
      .joins(:store)
      .select(
        "transactions.*, 
          stores.name as store_name,
          stores.owner as store_owner,
          stores.amount_total as store_amount_total,
          transaction_types.*"
      )
      .group("stores.id, transactions.id, transaction_types.id")
      .order("stores.name ASC")
  end

  def self.create(transactions)
    Transaction.create(transactions)
  end
end
