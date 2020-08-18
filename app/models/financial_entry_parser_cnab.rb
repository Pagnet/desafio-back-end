require 'fixed_format_file/base/dsl'
require 'fixed_format_file/cnab/line_reader'
require 'fixed_format_file/cnab/field_builder'

class FinancialEntryParserCNAB
  include FixedFormatFile::Base::DSL

  read_line_with FixedFormatFile::CNAB::LineReader
  build_field_with FixedFormatFile::CNAB::FieldBuilder

  field :kind, from: 1, to: 1
  field :transaction_date, from: 2, to: 9
  field :amount, from: 10, to: 19
  field :social_number, from: 20, to: 30
  field :card_number, from: 31, to: 42
  field :transaction_time, from: 43, to: 48
  field :store_owner, from: 49, to: 62
  field :store_name, from: 63, to: 81
end
