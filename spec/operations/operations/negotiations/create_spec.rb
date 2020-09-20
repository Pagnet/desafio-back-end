require 'rails_helper'

RSpec.describe Operations::Negotiations::Create do
  let(:operation) { Operations::Negotiations::Create.new }
  let(:invalid_params) { {} }
  let(:params) {
    {
      { :name => "BAR DO JOÃO", :representative => "JOÃO MACEDO" } => [
        {
          :negotiation_kind => "financing",
          :occurrence_at => "01/03/2019",
          :movement_value => 142,
          :beneficiary_identifier => "096.206.760-17",
          :credit_card => "4753****3153",
          :hour_of_occurrence => "15:34:53",
          :store_representative => "JOÃO MACEDO",
          :store_name => "BAR DO JOÃO",
          :store=>"BAR DO JOÃO"
        },
        {
          :negotiation_kind => "loan_receipt",
          :occurrence_at => "01/03/2019",
          :movement_value => 10042,
          :beneficiary_identifier => "196.206.760-17",
          :credit_card => "4753****3153",
          :hour_of_occurrence => "15:34:53",
          :store_representative => "JOÃO MACEDO",
          :store_name => "BAR DO JOÃO",
          :store=>"BAR DO JOÃO"
        }
      ],
      { :name => "MERCEARIA DO ZÉ DA ESQUINA", :representative => "SEU JOSÉ" } => [
        {
          :negotiation_kind => "credit",
          :occurrence_at => "01/10/2019",
          :movement_value => 14299,
          :beneficiary_identifier => "097.290.760-17",
          :credit_card => "4753****4000",
          :hour_of_occurrence => "05:44:53",
          :store_representative => "SEU JOSÉ",
          :store_name => "MERCEARIA DO ZÉ DA ESQUINA",
          :store => "MERCEARIA DO ZÉ DA ESQUINA"
        },
        {
          :negotiation_kind => "rent",
          :occurrence_at => "01/11/2019",
          :movement_value => 14299,
          :beneficiary_identifier => "097.290.760-17",
          :credit_card => "4753****4000",
          :hour_of_occurrence => "05:44:53",
          :store_representative => "SEU JOSÉ",
          :store_name => "MERCEARIA DO ZÉ DA ESQUINA",
          :store => "MERCEARIA DO ZÉ DA ESQUINA"
        }
      ]
    }
  }
  context 'when pass params valid' do
    it 'should return shopkeepers valids' do
      result = operation.call(params)
      shopkeepers = result.data[:shopkeepers]

      expect(shopkeepers.count).to eq(2)
      expect(shopkeepers.first.total_balance).to eq(9900.0)
      expect(shopkeepers.last.total_balance).to eq(0.0)
      expect(shopkeepers.first.negotiations.count).to eq(2)
      expect(shopkeepers.last.negotiations.count).to eq(2)
    end
  end

  context 'when pass params invalid' do
    it 'should return error message' do
      result = operation.call(invalid_params)
      expect(result.translated_errors).to include(I18n.t(result.errors.first[:error_key]))
    end
  end
end
