module FixedFormatFile
  module Base
    class FieldBuilder
      def self.build(name, **config)
        raise NotImplementedError, 'You have to implement build method'
      end
    end
  end
end
