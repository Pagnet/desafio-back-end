describe FinancialEntryParserCNAB do
  describe '#parse' do
    subject { described_class.new }
    let(:input) { '3201903010000014200096206760174753****3153153453JOÃO MACEDO   BAR DO JOÃO        ' }

    it 'returns read data as key/value pairs' do
      expect(subject.parse(input)).to eq({
        kind: '3',
        transaction_date: '20190301',
        amount: '0000014200',
        social_number: '09620676017',
        card_number: '4753****3153',
        transaction_time: '153453',
        store_owner: 'JOÃO MACEDO   ',
        store_name: 'BAR DO JOÃO        ',
      })
    end
  end
end
