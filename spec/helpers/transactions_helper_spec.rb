require 'rails_helper'

RSpec.describe TransactionsHelper, type: :helper do
  let!(:transaction) { FactoryBot.build_stubbed(:transaction) }

  context 'when only_date helper received DateTime' do
    it "should return data format '%d/%m/%Y'" do
      date_formatted = DateTime.now.localtime.strftime('%d/%m/%Y')

      expect(only_date(transaction.event_date_time)).to eq(date_formatted)
    end
  end

  context 'when only_time helper received DateTime' do
    it "should return time format '%H:%M:%S'" do
      time_formatted = DateTime.now.localtime.strftime('%H:%M:%S')

      expect(only_time(transaction.event_date_time)).to eq(time_formatted)
    end
  end

  context 'when cpf_mask helper received string' do
    it "should return CPF in format '000.000.000-00'" do
      expect(cpf_mask(transaction.beneficiary_cpf)).to eq('123.456.789-00')
    end
  end

  context 'when credit_card_number helper received transaction' do
    it "should return Credit Card Number in format '0000  ****  ****  0000'" do
      expect(credit_card_number(transaction)).to eq('1234  ****  ****  6789')
    end
  end
end
