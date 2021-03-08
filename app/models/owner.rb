# frozen_string_literal: true
class Owner < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :stores
end
