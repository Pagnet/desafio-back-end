require 'rails_helper'

describe CnabImportService do

  let(:importer) { FactoryBot.create(:importer) }
  let(:line) { "1201903010000020000556418150631234****3324090002MARIA JOSEFINALOJA DO Ó - MATRIZ" }

  it "#process_kind" do
    kind = CnabImportService.new(importer).process_kind(line)

    expect(kind[:kind]).to eq("input")
    expect(kind[:description]).to eq("Débito")
  end

  it "#process_processed_at" do
    date = CnabImportService.new(importer).process_processed_at(line)

    expect(date).to eq(DateTime.parse("01/03/2019 - 09:00:02"))
  end

  it "#process_amount" do
    amount = CnabImportService.new(importer).process_amount(line)

    expect(amount).to eq(20000)
  end

  it "#process_cpf" do
    cpf = CnabImportService.new(importer).process_cpf(line)

    expect(cpf).to eq("55641815063")
  end

  it "#process_cpf" do
    cpf = CnabImportService.new(importer).process_cpf(line)

    expect(cpf).to eq("55641815063")
  end

  it "#process_card" do
    card = CnabImportService.new(importer).process_card(line)

    expect(card).to eq("1234****3324")
  end

  it "#process_store" do
    store = CnabImportService.new(importer).process_store(line)

    expect(store.shopkeeper).to eq("MARIA JOSEFINA")
    expect(store.name).to eq("LOJA DO Ó - MATRIZ")
  end
end