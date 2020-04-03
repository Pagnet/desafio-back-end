# frozen_string_literal: true

# To handle store particularity
class Store < ApplicationRecord
  # Associations
  has_many :transactions

  # Validations
  validates_presence_of :name, :owner_name
end
