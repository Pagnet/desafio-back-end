class StoreDecorator < ApplicationDecorator
  delegate_all
  decorates_association :financial_entries

  def balance
    helpers.number_to_currency Command::Store::CalculateBalance.new(store: model).execute
  end
end
