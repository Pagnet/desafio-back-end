module Command
  module Store
    class CalculateBalance
      attr_accessor :store

      def initialize(store:)
        @store = store
      end

      def execute
        Service::Store::CalculateBalance.execute(store: @store)
      end
    end
  end
end
