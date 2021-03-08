# frozen_string_literal: true
class Store < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :transactions
  belongs_to :owner

  def balance
    transactions.positive.sum(:amount_in_cents) - transactions.negative.sum(:amount_in_cents)
  end
end
