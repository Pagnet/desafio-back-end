module Command
  module Store
    class Search
      attr_accessor :params

      def initialize(**params)
        @params = params
      end

      def execute
        Service::Store::Search.execute(@params)
      end
    end
  end
end
