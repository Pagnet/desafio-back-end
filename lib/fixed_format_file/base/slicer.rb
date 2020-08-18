module FixedFormatFile
  module Base
    class Slicer
      def self.slice(input:, format:)
        raise NotImplementedError, 'You have to implement slice method'
      end
    end
  end
end
