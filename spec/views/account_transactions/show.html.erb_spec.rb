require 'rails_helper'

RSpec.describe "account_transactions/show", type: :view do
  before(:each) do
    @account_transaction = assign(:account_transaction, AccountTransaction.create!(
      transaction_kind: nil,
      value: "",
      card: "Card",
      cpf: "Cpf",
      company: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Card/)
    expect(rendered).to match(/Cpf/)
    expect(rendered).to match(//)
  end
end
