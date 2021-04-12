class Store < ApplicationRecord
  validates_presence_of :owner
  validates_presence_of :name
end
