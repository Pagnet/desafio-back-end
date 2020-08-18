module Service
  module FinancialEntry
    class Destroy
      def self.execute(id:, **config)
        ActiveRecord::Base.transaction do
          record = ::FinancialEntry.find(id)
          record.destroy!

          record
        end
      end
    end
  end
end
