# frozen_string_literal: true

class Store < ApplicationRecord
  validates :name, presence: true
  validates :storekeeper, presence: true
end
