module Command
  module FinancialEntry
    class Destroy
      attr_accessor :id

      def initialize(id:)
        @id = id
      end

      def execute
        Service::FinancialEntry::Destroy.execute(id: @id)
      end
    end
  end
end
