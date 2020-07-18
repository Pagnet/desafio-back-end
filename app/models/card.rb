class Card < ApplicationRecord
  validates :number, presence: true, uniqueness: true
end
