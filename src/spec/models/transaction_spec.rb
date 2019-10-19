require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'associations' do
    it { should belong_to(:transaction_type) }
    it { should belong_to(:store) }
  end

  describe 'validations' do
    it { should validate_presence_of(:transaction_type) }
    it { should validate_presence_of(:store) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:total_amount) }
    it { should validate_numericality_of(:total_amount) }
  end

  context "scopes" do
    describe "#entrance"
    describe "#outgoing"
  end

end
