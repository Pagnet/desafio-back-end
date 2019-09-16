class Transaction < ApplicationRecord
  belongs_to :transaction_type
  belongs_to :store
  belongs_to :store_owner
  belongs_to :cnab_file, required: false

  delegate :description, to: :transaction_type, prefix: true, allow_nil: true
  delegate :name, to: :store, prefix: true, allow_nil: true

  def formatted_occurred_at
    self.occurred_at&.to_formatted_s(:db)
  end
end
