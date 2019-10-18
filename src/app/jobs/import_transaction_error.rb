class ImportTransactionError < StandardError
  attr_reader :raw

  def initialize(message, raw: nil, parsed: nil)
    super("Transaction import error: #{message}\n#{raw}\n")
    @raw = raw
  end
end