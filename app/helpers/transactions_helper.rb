# frozen_string_literal: true

module TransactionsHelper
  def only_date(date_time)
    date_time.localtime.strftime('%d/%m/%Y')
  end

  def only_time(date_time)
    date_time.localtime.strftime('%H/%M/%S')
  end

  def cpf_mask(cpf)
    "#{cpf.first(3)}.#{cpf[3...6]}.#{cpf[6...]}-#{cpf.last(2)}"
  end

  def credit_card_number(transaction)
    "#{transaction.credit_card_first_digits}  * * * *  * * * *  #{transaction.credit_card_last_digits}"
  end
end
