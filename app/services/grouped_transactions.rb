class GroupedTransactions < ApplicationService
  attr_accessor :imported_file, :result

  def initialize(imported_file)
    @imported_file = imported_file
    @result = []
  end

  def call
    grouped_transactions = @imported_file.transactions.group_by(&:name)

    grouped_transactions.each do |store, transactions|
      @result << {
        store: store,
        transactions: transactions,
        balance: get_balance(transactions)
      }
    end

    return @result
  end

  private

  def get_balance(transactions)
    grouped_by_kind = transactions.group_by(&:kind)
    outcoming = grouped_by_kind['outcoming'].nil? ? 0 : grouped_by_kind['outcoming'].sum(&:value)
    incoming = grouped_by_kind['incoming'].nil? ? 0 : grouped_by_kind['incoming'].sum(&:value)
    balance = incoming - outcoming
  end
end