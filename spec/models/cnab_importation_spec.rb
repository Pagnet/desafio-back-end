require 'rails_helper'

RSpec.describe CnabImportation, type: :model do

  let!(:cnab_importation) { create(:cnab_importation) }

  context 'validation' do
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:file) }
  end

  context 'create' do
    it 'must return the starting status' do
      expect(cnab_importation.status).to eq("starting")
    end

    it 'must return the default results' do
      expect(cnab_importation.file[0]["line"]).to eq(1)
      expect(cnab_importation.file[0]["cpf"]).to be_truthy
      expect(cnab_importation.file[0]["date"]).to be_truthy
      expect(cnab_importation.file[0]["time"]).to be_truthy
      expect(cnab_importation.file[0]["amount"]).to be_truthy
      expect(cnab_importation.file[0]["status"]).to be_truthy
      expect(cnab_importation.file[0]["store_name"]).to be_truthy
      expect(cnab_importation.file[0]["card_number"]).to be_truthy
      expect(cnab_importation.file[0]["store_owner"]).to be_truthy
      expect(cnab_importation.file[0]["transaction_type"]).to be_truthy
      expect(cnab_importation.file[0]["record"]).to eq("3201903010000014200096206760174753****3153153453JOÃO MACEDO   BAR DO JOÃO       \n")
    end
  end

  context 'update status' do
    it 'must return the processing status' do
      cnab_importation.update_status(:processing)
      expect(cnab_importation.status).to eq("processing")
    end

    it 'must return the concluded status' do
      cnab_importation.update_status(:concluded)
      expect(cnab_importation.status).to eq("concluded")
    end

    it 'must return the failed status' do
      cnab_importation.update_status(:failed)
      expect(cnab_importation.status).to eq("failed")
    end
  end

end
