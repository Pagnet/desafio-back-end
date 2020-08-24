require_relative 'base/slicer'

module FixedFormatFile
  class OneIndexedSlicer < ::FixedFormatFile::Base::Slicer
    def self.slice(input:, format:)
      format.map do |range|
        first, last = range
        input.slice(Range.new(first - 1, last - 1))
      end
    end
  end
end
