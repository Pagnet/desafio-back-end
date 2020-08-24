module Command
  module FinancialEntry
    class Import
      attr_accessor :file

      def initialize(file:)
        @file = file
      end

      def execute
        Service::FinancialEntry::Import.execute(file: @file)
      end
    end
  end
end
