module Transaction::Events
  extend ActiveSupport::Concern

  included do
    include Transaction::Publisher

    after_create :created_transaction

    def created_transaction
      broadcast(:created_transaction, company)
    end
  end
end
