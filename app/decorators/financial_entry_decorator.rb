class FinancialEntryDecorator < ApplicationDecorator
  delegate_all

  def amount
    helpers.number_to_currency model.signed_amount
  end

  def transaction_date
    model.transaction_date.to_formatted_s(:long_ordinal)
  end

  def transaction_time
    model.transaction_time.to_formatted_s(:time)
  end
end
