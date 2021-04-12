module Services
  module Cnab
    def self.fields
      {
        transaction_type: 0..0,
        occurrence_date: 1..8,
        amount: 9..18,
        cpf: 19..29,
        card_number: 30..41,
        occurrence_time: 42..47,
        store_owner: 48..61,
        store_name: 62..80,
      }
    end
  end
end
