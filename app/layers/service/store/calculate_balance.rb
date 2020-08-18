module Service
  module Store
    class CalculateBalance
      def self.execute(store:, **config)
        store.financial_entries.reduce(BigDecimal('0')) do |sum, entry|
          operation = ::FinancialEntry.kind_operator(entry.kind)
          sum = sum.send(operation, entry.amount)
        end
      end
    end
  end
end
