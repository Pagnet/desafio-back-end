module FixedFormatFile
  module Base
    class Reader
      attr_accessor :fields

      def initialize(**config)
        @fields = config.fetch(:fields) { Hash.new }
      end

      def read(input:)
        raise NotImplementedError, 'You have to implement read method'
      end
    end
  end
end
