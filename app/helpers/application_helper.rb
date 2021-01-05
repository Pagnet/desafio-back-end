module ApplicationHelper

  def format_money(value)
    "R$ #{number_with_precision(value, precision: 2)}"
  end

  def format_money_negative(value)
    "R$ - #{number_with_precision(value, precision: 2)}"
  end

  def format_date(value)
    value.strftime('%d/%m/%Y %I:%M:%S')
  end

end
