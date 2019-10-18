class Transaction < ApplicationRecord
  EXPENSES_TYPES = %w[billet financing rental].freeze
  WINNINGS_TYPES = %w[debit credit loan_receipt sells ted_receipt doc_receipt].freeze

  belongs_to :customer
  enum transaction_type: { debit: 1, billet: 2, financing: 3, credit: 4, loan_receipt: 5, sells: 6, ted_receipt: 7,
                           doc_receipt: 8, rental: 9 }

  before_save :update_value_if_expense_transaction_type, if: -> { EXPENSES_TYPES.include?(transaction_type) }

  scope :expenses, -> { where(transaction_type: EXPENSES_TYPES) }
  scope :winnings, -> { where(transaction_type: WINNINGS_TYPES) }

  private

    def update_value_if_expense_transaction_type
      self.value *= -1
    end
end
