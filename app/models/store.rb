class Store < ApplicationRecord

  # Associations

  has_many :operations


  #  Validations

  validates :name, presence: true
  validates :name, uniqueness: true
end
