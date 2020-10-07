class Company < ApplicationRecord
  validates :name, presence: true
end
