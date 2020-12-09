# frozen_string_literal: true

class Store < ApplicationRecord
  validates_length_of :name, maximum: 19
  validates :name, uniqueness: { case_sensitive: false }, presence: true

  has_many :cnabs

  def self.extract_name(cnab)
    cnab[62..80].gsub(/ *$/, '')
  end
end
