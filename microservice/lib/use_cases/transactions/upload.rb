module UseCases
  module Transactions
    module Upload
      class CNAB
        def self.execute(file)
          parse_file(file)
        end

        private

        def self.parse_file(file)
          transactions = []
          File.foreach(file.path).with_index do |line, index|
            transaction_type = Repositories::TransactionTypeRepository::find_by_numeric_type(
              rule_transaction_type(line)
            )

            store = Repositories::StoreRepository::find_or_create({
              :name => rule_store_name(line),
              :owner => rule_store_owner(line),
            })

            transactions << {
              transaction_type_id: transaction_type.id,
              occurrence_date: rule_occurrence_date(line),
              amount: format_amount(rule_amount(line)),
              cpf: rule_cpf(line),
              card_number: rule_card_number(line),
              occurrence_time: rule_occurrence_time(line),
              store_id: store.id,
            }
          end

          transactions
        end

        def self.rule_transaction_type(line)
          line.slice(0..0)
        end

        def self.rule_occurrence_date(line)
          line.slice(1..8)
        end

        def self.rule_amount(line)
          line.slice(9..18)
        end

        def self.rule_cpf(line)
          line.slice(19..29)
        end

        def self.rule_card_number(line)
          line.slice(30..41)
        end

        def self.rule_occurrence_time(line)
          line.slice(42..47)
        end

        def self.rule_store_owner(line)
          line.slice(48..61)
        end

        def self.rule_store_name(line)
          line.slice(62..80)
        end

        def self.format_amount(amount)
          amount.to_f / 100
        end

        def validate_data(attrs)
          # puts "validate_data"
        end
      end
    end
  end
end
