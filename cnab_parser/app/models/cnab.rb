# frozen_string_literal: true

class Cnab < ApplicationRecord
  validates :date, presence: true
  validates :cnab_type, presence: true, numericality: { only_integer: true }
  validates :value, numericality: true, presence: true
  validates :document, format: { with: /\A[0-9]{11}\z/,
                                 message: message('documento') }, presence: true
  validates :card, format: { with: /\A[0-9*]{12}\z/,
                             message: message('cartão') }, presence: true
  validates :file_name, uniqueness: { scope: %i[date value document] }

  belongs_to :store
  belongs_to :user

  def parse_cnab(cnab)
    self.cnab_type = cnab[0]
    self.date = cnab[1..8] + cnab[42..47]
    self.value = cnab[9..18].to_f / 100 * value_type
    self.document = cnab[19..29]
    self.card = cnab[30..41]
  end

  def value_type
    return -1 if [2, 3, 9].include?(cnab_type)

    1
  end
end
