require "rails_helper"

describe "stores", type: :feature do
  let!(:store_1) { FactoryBot.create(:store, name: "Loja 1") }
  let!(:store_2) { FactoryBot.create(:store, name: "Loja 2") }

  let!(:transaction_1) { FactoryBot.create(:transaction, kind: "input", kind_description: "Débito", amount: 20000, store: store_1) }
  let!(:transaction_2) { FactoryBot.create(:transaction, kind: "input", kind_description: "Débito", amount: 30000, store: store_1) }
  let!(:transaction_3) { FactoryBot.create(:transaction, kind: "output", kind_description: "Financiamento", amount: 1000, store: store_1) }
  let!(:transaction_4) { FactoryBot.create(:transaction, kind: "input", kind_description: "Vendas", amount: 220000, store: store_2) }


  it "list all stores" do
    visit stores_path
    expect(page.all(:css, "tr.store").count).to eq(2)
  end

  it "view store balance" do
    visit store_path(store_1)
    expect(page.all(:css, "tr.transaction").count).to eq(3)
    expect(page).to have_css("h2.balance", text: "Saldo: R$ 490,00")
  end
end