class StoreDecorator < ApplicationDecorator
  delegate_all
  decorates_association :financial_entries

  def balance
    helpers.number_to_currency Command::Store::CalculateBalance.new(store: model).execute
  end

  def created_at
    model.created_at.to_formatted_s(:long)
  end
end
