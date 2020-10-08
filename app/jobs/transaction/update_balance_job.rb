class Transaction::UpdateBalanceJob < Transaction::ApplicationJob
  def perform(company)
    balance = AccountBalance.find_or_create_by(company_id: company.id)

    new_value = company.account_transactions.sum(:value_cents)

    balance.update_attribute(:value_cents, new_value)
  end
end
