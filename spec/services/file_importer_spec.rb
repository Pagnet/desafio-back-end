RSpec.describe FileImporter do
  before { Rails.application.load_seed }
  
  context 'when received a cnab file' do
    it 'should create a correct Store' do
      FileImporter.call(valid_cnab_file)

      store = Store.find_by(name: 'BAR DO JOÃO', owner_name: 'JOÃO MACEDO')

      expect(store.present?).to be_truthy
    end

    it 'should create a Credit Card' do
      FileImporter.call(valid_cnab_file)

      credit_card = CreditCard.find_by(first_digits: '4753', last_digits: '3153')

      expect(credit_card.present?).to be_truthy
    end

    it 'should create a Transaction' do
      FileImporter.call(valid_cnab_file)

      transaction = Transaction.find_by(
        event_date_time: DateTime.parse('2019-03-01 15:34:53 -0300'),
        amount: 142.0,
        beneficiary_cpf: '96206760174'
      )

      expect(transaction.present?).to be_truthy
    end
  end
end
