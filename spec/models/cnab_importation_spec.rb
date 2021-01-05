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

    it 'must return the default original filename' do
      expect(cnab_importation.file[0]["original_filename"]).to eq("CNAB.txt")
    end
  end

  context 'update status for processing' do
    cnab_importation = CnabImportation.last
    cnab_importation.update_status(:processing)
    it 'must return the processing status' do
      expect(cnab_importation.status).to eq("processing")
    end
  end

  context 'update status for concluded' do
    cnab_importation = CnabImportation.last
    cnab_importation.update_status(:concluded)
    it 'must return the concluded status' do
      expect(cnab_importation.status).to eq("concluded")
    end
  end

  context 'update status for failed' do
    cnab_importation = CnabImportation.last
    cnab_importation.update_status(:failed)
    it 'must return the failed status' do
      expect(cnab_importation.status).to eq("failed")
    end
  end

end


