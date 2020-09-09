class Importer < ApplicationRecord
  has_one_attached :file

  has_many :transactions

  validates :file, presence: true

  after_create :process_transactions

  private

  def process_transactions
    CnabImportService.new(self).process
  end
end
