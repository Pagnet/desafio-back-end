module Transaction::Events
  extend ActiveSupport::Concern

  included do
    include Transaction::Publisher

    after_create :created_transactions

    def created_transaction
      broadcast(:created_transaction, self)
    end
  end
end
