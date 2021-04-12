require "rails_helper"

RSpec.describe TransactionType, type: :model do
  subject {
    described_class.new(numeric_type: 1,
                        description: "Débito",
                        operation_type: "entrada",
                        signal: "positive")
  }

  it "is valid with correct attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without numeric_type" do
    subject.numeric_type = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without operation_type" do
    subject.operation_type = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without signal" do
    subject.signal = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with invalid operation_type" do
    expect { subject.operation_type = "Teste" }.to raise_error(ArgumentError)
  end

  it "is not valid with invalid signal" do
    expect { subject.signal = "teste" }.to raise_error(ArgumentError)
  end
end
