require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it '- Should be able to see that attributes cannot be blank' do
    transaction = Transaction.new

    transaction.valid?

    expect(transaction.errors[:transaction_type]).to include('não pode ficar em branco')
    expect(transaction.errors[:date]).to include('não pode ficar em branco')
    expect(transaction.errors[:value]).to include('não pode ficar em branco')
    expect(transaction.errors[:cpf]).to include('não pode ficar em branco')
    expect(transaction.errors[:card]).to include('não pode ficar em branco')
    expect(transaction.errors[:hour]).to include('não pode ficar em branco')
    expect(transaction.errors[:store_owner]).to include('não pode ficar em branco')
    expect(transaction.errors[:store_name]).to include('não pode ficar em branco')
  end
end
