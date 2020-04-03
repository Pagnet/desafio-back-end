# frozen_string_literal: true

require_relative '../../rails_helper'

RSpec.describe CnabImporter::Processor do
  let!(:transaction_type) { FactoryBot.create(:transaction_type) }

  context 'when received a cnab file' do
    it 'should create a correct Store' do
      CnabImporter::Processor.new(valid_cnab_file).call

      store = Store.find_by(name: 'BAR DO JOÃO', owner_name: 'JOÃO MACEDO')

      expect(store.present?).to be_truthy
    end

    it 'should create a Credit Card' do
      CnabImporter::Processor.new(valid_cnab_file).call

      credit_card = CreditCard.find_by(first_digits: '4753', last_digits: '3153')

      expect(credit_card.present?).to be_truthy
    end

    it 'should create a Transaction' do
      CnabImporter::Processor.new(valid_cnab_file).call

      transaction = Transaction.find_by(
        event_date_time: DateTime.parse('2019-03-01 15:34:53 -0300'),
        amount: 142.0,
        beneficiary_cpf: '96206760174'
      )

      expect(transaction.present?).to be_truthy
    end
  end

  context 'when received a cnab file with a invalid line length' do
    it 'should skip registration of transaction' do
      CnabImporter::Processor.new(invalid_line_cnab_file).call

      expect(Transaction.all.none?).to be_truthy
    end
  end

  context 'when dont received a cnab file' do
    it 'should return MissingFile Exception' do
      expect do
        CnabImporter::Processor.new(nil)
      end.to raise_error(Exceptions::MissingFileError)
    end
  end
end
