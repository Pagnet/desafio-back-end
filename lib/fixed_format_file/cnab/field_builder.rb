require_relative '../base/field_builder'

module FixedFormatFile
  module CNAB
    class FieldBuilder < ::FixedFormatFile::Base::FieldBuilder
      def self.build(name, from:, to:, **config)
        { name => [from, to] }
      end
    end
  end
end
