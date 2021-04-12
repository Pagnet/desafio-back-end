require "rails_helper"

RSpec.describe Store, type: :model do
  subject {
    described_class.new(
      owner: "JOÃO MACEDO  ",
      name: "BAR DO JOÃO       ",
    )
  }

  it "should create new with correct attributes" do
    expect(subject).to be_valid
  end

  it "should create amount_total with default value zero" do
    expect(subject.amount_total).to eq(0.0)
  end

  it "should not create when owner not exist" do
    subject.owner = nil
    expect(subject).to_not be_valid
  end

  it "should not create when name not exist" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
