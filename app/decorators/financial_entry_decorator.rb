class FinancialEntryDecorator < ApplicationDecorator
  delegate_all

  def amount
    helpers.number_to_currency model.signed_amount
  end
end
