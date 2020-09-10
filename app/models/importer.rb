class Importer < ApplicationRecord
  has_one_attached :file

  has_many :transactions

  validates :file, presence: true
end
