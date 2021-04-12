require "rails_helper"

RSpec.describe Transaction, type: :model do
  transactionType = TransactionType.create(numeric_type: 1,
                                           description: "Débito",
                                           operation_type: "Entrada",
                                           signal: "Positive")

  store = Store.create(owner: "JOÃO MACEDO  ", name: "BAR DO JOÃO       ")

  subject {
    described_class.new(
      occurrence_date: "20190301",
      amount: 0000014200 / 100,
      cpf: "11111111111",
      card_number: "4753****3153",
      occurrence_time: "153453",
      store_id: store.id,
      transaction_type_id: transactionType.id,
    )
  }

  it "is valid with correct attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without store_id relation" do
    subject.store_id = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without transaction_type_id relation" do
    subject.transaction_type_id = nil
    expect(subject).to_not be_valid
  end

  it "is valid with formatted occurrence_date" do
    subject.occurrence_date = "2019-03-01"
    expect(subject).to be_valid
  end

  it "is not valid with incorrect amount" do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with incorrect occurrence_date" do
    subject.occurrence_date = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with incorrect cpf" do
    subject.cpf = "fakeCPF"
    expect(subject).to_not be_valid
  end

  it "is not valid with incorrect cpf size" do
    subject.cpf = "12345"
    expect(subject).to_not be_valid
  end

  it "is not valid with incorrect card_number" do
    subject.card_number = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with incorrect card_number size" do
    subject.card_number = "123809"
    expect(subject).to_not be_valid
  end

  it "is not valid with incorrect occurrence_time" do
    subject.occurrence_time = "faketime"
    expect(subject).to_not be_valid
  end

  it "is not valid with incorrect occurrence_time size" do
    subject.occurrence_time = "12504400"
    expect(subject).to_not be_valid
  end
end
