module FixedFormatFile
  module Base
    class Reader
      def initialize(**args)
      end

      def read(input:)
        raise NotImplementedError, 'You have to implement read method'
      end
    end
  end
end
