require_relative '../base/reader'

module FixedFormatFile
  module CNAB
    class LineReader < ::FixedFormatFile::Base::Reader
      def initialize(**config)
        super

        @slicer = config.fetch(:slicer) { FixedFormatFile::OneIndexedSlicer }
      end

      def read(input:)
        Hash[@fields.keys.zip(@slicer.slice(input: input, format: @fields.values))] if @fields&.any?
      end
    end
  end
end
