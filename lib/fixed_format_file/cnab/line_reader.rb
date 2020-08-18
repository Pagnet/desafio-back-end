require_relative '../base/reader'

module FixedFormatFile
  module CNAB
    class LineReader < ::FixedFormatFile::Base::Reader
      def initialize(fields:, **config)
        super

        @fields = fields
        @slicer = config.fetch(:slicer) { FixedFormatFile::OneIndexedSlicer }
      end

      def read(input:)
        Hash[@fields.keys.zip(@slicer.slice(input: input, format: @fields.values))]
      end
    end
  end
end
