require "rails_helper"

describe "transactions", type: :feature do
  let!(:transaction_1) { FactoryBot.create(:transaction) }
  let!(:transaction_2) { FactoryBot.create(:transaction) }
  let!(:transaction_3) { FactoryBot.create(:transaction) }

  it "list all transactions" do
    visit transactions_path
    expect(page.all(:css, "tr.transaction").count).to eq(3)
  end
end