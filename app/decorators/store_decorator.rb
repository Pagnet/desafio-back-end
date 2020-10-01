class StoreDecorator < Draper::Decorator
  delegate_all

  def current_balance
    total_input - total_output
  end

  def total_output
    output = TransactionType.output
    transactions.where(transaction_type: output).sum(&:amount).to_f
  end

  def total_input
    input = TransactionType.input
    transactions.where(transaction_type: input).sum(&:amount).to_f
  end
end
