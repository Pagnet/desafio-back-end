require 'rails_helper'

RSpec.describe "account_transactions/index", type: :view do
  before(:each) do
    assign(:account_transactions, [
      AccountTransaction.create!(
        transaction_kind: nil,
        value: "",
        card: "Card",
        cpf: "Cpf",
        company: nil
      ),
      AccountTransaction.create!(
        transaction_kind: nil,
        value: "",
        card: "Card",
        cpf: "Cpf",
        company: nil
      )
    ])
  end

  it "renders a list of account_transactions" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "Card".to_s, count: 2
    assert_select "tr>td", text: "Cpf".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
