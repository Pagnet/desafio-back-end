class Store < ApplicationRecord
  validates_presence_of :name, :owner
  validates_uniqueness_of :name
end
