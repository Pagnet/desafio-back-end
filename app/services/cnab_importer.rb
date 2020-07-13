class CnabImporter < ApplicationService
  attr_reader :imported_file

  def initialize(imported_file)
    @imported_file = imported_file
  end

  def call
    return false unless @imported_file.save

    @imported_file.attachment.read.each_line do |line|
      parser = CnabLineParser.new(line)
      Transaction.create(imported_file: @imported_file,
                         occurrence_datetime: parser.occurrence_datetime,
                         value: parser.value,
                         beneficiary_document: parser.beneficiary_document,
                         credit_card_number: parser.credit_card_number,
                         type_info: {
                           description: parser.type[:description],
                           kind: parser.type[:kind]
                         },
                         store_info: {
                           name: parser.store[:name],
                           owner_name: parser.store[:owner_name]
                         })
    end

    {
      imported_file: @imported_file,
      errors: @imported_file.errors
    }
  end
end