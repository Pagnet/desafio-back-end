# encoding: utf-8

class CnabParser
  CNAB_LINE_REGEX = /\A\d{34}\*{4}\d{10}[\wÀ-ú\s\-]{32}$\z/u

  def self.parse(cnab_data)
    cnab_data.force_encoding('UTF-8').split(/\n/).map do |t|
      return nil unless t.match(CNAB_LINE_REGEX).present?

      type, value, card_number, datetime = [t[0], (t[9..18].to_f / 100), t[30..41], (t[1..8] + t[42..47])]
      cpf, name, company_name = [t[19..29], t[48..61].strip, t[62..80].strip]

      type = Transaction.transaction_types.invert[type.to_i]
      datetime = Time.parse(datetime)
      
      {
        customer: { name: name, company_name: company_name, cpf: cpf },
        transaction: { transaction_type: type, value: value, card_number: card_number, ocurrence_datetime: datetime }
      }
    end.compact
  end
end
