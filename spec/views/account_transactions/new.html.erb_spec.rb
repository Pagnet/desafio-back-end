require 'rails_helper'

RSpec.describe "account_transactions/new", type: :view do
  before(:each) do
    assign(:account_transaction, AccountTransaction.new(
      transaction_kind: nil,
      value: "",
      card: "MyString",
      cpf: "MyString",
      company: nil
    ))
  end

  it "renders new account_transaction form" do
    render

    assert_select "form[action=?][method=?]", account_transactions_path, "post" do

      assert_select "input[name=?]", "account_transaction[transaction_kind_id]"

      assert_select "input[name=?]", "account_transaction[value]"

      assert_select "input[name=?]", "account_transaction[card]"

      assert_select "input[name=?]", "account_transaction[cpf]"

      assert_select "input[name=?]", "account_transaction[company_id]"
    end
  end
end
