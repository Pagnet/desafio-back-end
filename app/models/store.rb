# frozen_string_literal: true

class Store < ApplicationRecord
  has_many :store_operations, dependent: :destroy

  validates :name, presence: true
  validates :storekeeper, presence: true
end
