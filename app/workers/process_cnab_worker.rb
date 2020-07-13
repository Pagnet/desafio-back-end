class ProcessCnabWorker
  include Sidekiq::Worker

  sidekiq_options queue: :default

  def perform(file_id)
    imported_file = ImportedFile.find(file_id)

    imported_file.attachment.read.each_line do |line|
      parser = CnabLineParser.new(line)
      Transaction.find_or_create_by(occurrence_datetime: parser.occurrence_datetime,
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
  end
end
