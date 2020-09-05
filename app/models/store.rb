class Store < ApplicationRecord

  # Associations

  has_many :operations


  #  Validations

  validates :name, presence: true
  validates :name, uniqueness: true


  # Helpers

  def balance
    operations.sum(:signed_value)
  end
end
