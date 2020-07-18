class Store < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
