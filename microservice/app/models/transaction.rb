class Transaction < ApplicationRecord
  CPF_MIN_MAX_SIZE = 11
  CARD_NUMBER_MAX_SIZE = 12
  OCCURRENCE_TIME_MIN_MAX_SIZE = 6

  validates_presence_of :occurrence_date
  validates_presence_of :amount
  validates_presence_of :cpf
  validates_presence_of :card_number
  validates_presence_of :occurrence_time

  validates :occurrence_time, :numericality => { :only_integer => true }

  validates :cpf, :numericality => { :only_integer => true }

  validates_length_of :occurrence_time,
                      minimum: OCCURRENCE_TIME_MIN_MAX_SIZE,
                      maximum: OCCURRENCE_TIME_MIN_MAX_SIZE,
                      allow_blank: false

  validates_length_of :cpf,
                      minimum: CPF_MIN_MAX_SIZE,
                      maximum: CPF_MIN_MAX_SIZE,
                      allow_blank: false

  validates_length_of :card_number,
                      minimum: CARD_NUMBER_MAX_SIZE,
                      maximum: CARD_NUMBER_MAX_SIZE,
                      allow_blank: false

  belongs_to :store
  belongs_to :transaction_type
end
