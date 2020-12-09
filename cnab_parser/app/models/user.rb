# frozen_string_literal: true

class User < ApplicationRecord
  validates_length_of :name, maximum: 14
  validates :name, uniqueness: { case_sensitive: false }, presence: true

  has_many :cnabs

  def self.extract_name(cnab)
    cnab[48..61].gsub(/ *$/, '')
  end
end
