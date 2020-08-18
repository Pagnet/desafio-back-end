require_relative '../base/reader'
require_relative '../one_indexed_slicer'

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
