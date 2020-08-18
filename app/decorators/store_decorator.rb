class StoreDecorator < ApplicationDecorator
  delegate_all

  def balance
    Command::Store::CalculateBalance.new(store: model).execute
  end
end
