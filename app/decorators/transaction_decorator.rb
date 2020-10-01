class TransactionDecorator < Draper::Decorator
  delegate_all

  def transaction_type
    "#{object.transaction_type.description} #{object.transaction_type.icon_representation}"
  end

  def event_date_time
    object.event_date_time.localtime.strftime('%d/%m/%Y %H:%M:%S')
  end

  def beneficiary_cpf
    cpf = object.beneficiary_cpf
    "#{cpf.first(3)}.#{cpf[3...6]}.#{cpf[6...9]}-#{cpf.last(2)}"
  end

  def credit_card_number
    "#{object.credit_card_first_digits}  ****  ****  #{object.credit_card_last_digits}"
  end
end
