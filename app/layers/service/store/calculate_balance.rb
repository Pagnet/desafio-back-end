module Service
  module Store
    class CalculateBalance
      def self.execute(store:, **config)
        store.financial_entries.reduce(BigDecimal('0')) do |sum, entry|
          sum += entry.signed_amount
        end
      end
    end
  end
end
