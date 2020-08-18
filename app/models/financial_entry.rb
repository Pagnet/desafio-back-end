class FinancialEntry < ApplicationRecord
  attribute :kind,             :integer
  attribute :transaction_date, :date
  attribute :transaction_time, :unformatted_time
  attribute :amount,           :amount_in_cents
  attribute :social_number,    :string
  attribute :card_number,      :string
  attribute :store_id,         :big_integer
  attribute :created_at,       :datetime
  attribute :updated_at,       :datetime

  validates_presence_of %i(store kind transaction_date amount social_number transaction_time)

  belongs_to :store

  enum kind: {
    debit: 1,
    boleto: 2,
    loan: 3,
    credit: 4,
    loan_discharge: 5,
    sale: 6,
    transfer_ted: 7,
    transfer_doc: 8,
    rent: 9,
  }

  def self.kind_operator(kind)
    {
      debit: :+,
      boleto: :-,
      loan: :-,
      credit: :+,
      loan_discharge: :+,
      sale: :+,
      transfer_ted: :+,
      transfer_doc: :+,
      rent: :-,
    }[kind]
  end
end
