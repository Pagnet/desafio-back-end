module Service
  module FinancialEntry
    class Import
      def self.execute(file:, **config)
        parser = config.fetch(:parser) { FinancialEntryParserCNAB.new }

        associated_stores = Hash.new do |hash, (store_name, store_owner)|
          hash[[store_name, store_owner]] = ::Store.find_or_create_by!(name: store_name, owner: store_owner)
        end

        ActiveRecord::Base.transaction do
          processed_count = 0

          File.foreach(file) do |line|
            if (line = line.squish).present?
              entry_data = parser.parse(line).transform_values!(&:squish)
              store = associated_stores[entry_data.values_at(:store_name, :store_owner)]

              entry = store.financial_entries.create!(
                kind: ::FinancialEntry.kinds.key(entry_data[:kind].to_i),
                transaction_date: entry_data[:transaction_date],
                amount: entry_data[:amount],
                social_number: entry_data[:social_number],
                card_number: entry_data[:card_number],
                transaction_time: entry_data[:transaction_time],
              )

              processed_count += 1
            end
          end

          return processed_count
        rescue StandardError => e
          raise "Save failed at line #{processed_count + 1}: #{e.message}"
        end
      end
    end
  end
end
