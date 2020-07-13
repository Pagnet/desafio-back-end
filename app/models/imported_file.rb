class ImportedFile < ApplicationRecord
  include TransactionsUploader::Attachment(:attachment)

  has_many :transactions

  validates_presence_of :attachment
end
