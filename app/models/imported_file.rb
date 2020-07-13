class ImportedFile < ApplicationRecord
  include TransactionsUploader::Attachment(:attachment)

  validates_presence_of :attachment
end
