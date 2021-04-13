module UseCases
  module Transactions
    class Import
      def self.execute(file = nil)
        validate_file(file)
        Repositories::TransactionRepository.create(parse_file(file))
      end

      private

      def self.parse_file(file)
        transactions = []
        File.foreach(file.path).with_index do |line, index|
          transaction_type = get_transaction_type(rule_transaction_type(line))

          amount = format_amount(rule_amount(line))

          store = get_store({
            :name => rule_store_name(line),
            :owner => rule_store_owner(line),
          })

          sum_store_amount_total(store, amount)

          transactions << get_formated_transaction(
            line,
            transaction_type.id,
            store.id,
            amount,
          )
        end

        transactions
      end

      def self.get_formated_transaction(line, transaction_type_id, store_id, amount)
        {
          transaction_type_id: transaction_type_id,
          occurrence_date: rule_occurrence_date(line),
          amount: amount,
          cpf: rule_cpf(line),
          card_number: rule_card_number(line),
          occurrence_time: rule_occurrence_time(line),
          store_id: store_id,
        }
      end

      def self.get_transaction_type(numeric_type)
        Repositories::TransactionTypeRepository::find_by_numeric_type(
          numeric_type
        )
      end

      def self.get_store(fields)
        Repositories::StoreRepository::find_or_create({
          :name => fields[:name],
          :owner => fields[:owner],
        })
      end

      def self.sum_store_amount_total(store, amount)
        store.amount_total += amount
        store.save
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

      def self.validate_file(file)
        raise "File not found" if file.nil?
      end
    end
  end
end
