require 'rails_helper'

RSpec.describe "account_transactions/edit", type: :view do
  before(:each) do
    @account_transaction = assign(:account_transaction, AccountTransaction.create!(
      transaction_kind: nil,
      value: "",
      card: "MyString",
      cpf: "MyString",
      company: nil
    ))
  end

  it "renders the edit account_transaction form" do
    render

    assert_select "form[action=?][method=?]", account_transaction_path(@account_transaction), "post" do

      assert_select "input[name=?]", "account_transaction[transaction_kind_id]"

      assert_select "input[name=?]", "account_transaction[value]"

      assert_select "input[name=?]", "account_transaction[card]"

      assert_select "input[name=?]", "account_transaction[cpf]"

      assert_select "input[name=?]", "account_transaction[company_id]"
    end
  end
end
