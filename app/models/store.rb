class Store < ApplicationRecord

  # Associations

  has_many :operations, -> { order(occurred_at: :desc) }


  #  Validations

  validates :name, presence: true
  validates :name, uniqueness: true


  # Helpers

  def self.sorted
    order(:name)
  end

  def balance
    operations.sum(:signed_value)
  end
end
