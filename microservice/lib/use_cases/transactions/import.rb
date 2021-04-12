module UseCases
  module Transactions
    class Import
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
        line.slice(Services::Cnab::fields[:transaction_type])
      end

      def self.rule_occurrence_date(line)
        line.slice(Services::Cnab::fields[:occurrence_date])
      end

      def self.rule_amount(line)
        line.slice(Services::Cnab::fields[:amount])
      end

      def self.rule_cpf(line)
        line.slice(Services::Cnab::fields[:cpf])
      end

      def self.rule_card_number(line)
        line.slice(Services::Cnab::fields[:card_number])
      end

      def self.rule_occurrence_time(line)
        line.slice(Services::Cnab::fields[:occurrence_time])
      end

      def self.rule_store_owner(line)
        line.slice(Services::Cnab::fields[:store_owner])
      end

      def self.rule_store_name(line)
        line.slice(Services::Cnab::fields[:store_name])
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
