class Importer < ApplicationRecord

  # Enums

  enum status: %i[pending in_progress success error]


  # Attachments

  has_one_attached :file


  #  Validations

  validates :status, presence: true

  validates :file, attached: true
end
