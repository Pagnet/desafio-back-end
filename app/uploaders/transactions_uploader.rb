class TransactionsUploader < Shrine
  plugin :data_uri

  Attacher.validate do
    validate_mime_type_inclusion ['text/plain']
  end
end