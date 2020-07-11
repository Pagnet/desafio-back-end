class ImportedFile < ApplicationRecord
  include TransactionsUploader[:attachment]

  validates_presence_of :attachment_data
end
