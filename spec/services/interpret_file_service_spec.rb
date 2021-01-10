require 'rails_helper'

RSpec.describe InterpretFileService do

  let(:valid_file){
    [
      "1201903010000014200096206760174753****3153153453JOÃO MACEDO   BAR DO JOÃO       \n", 
      "2201903010000013200556418150633123****7687145607MARIA JOSEFINALOJA DO Ó - MATRIZ\n", 
      "2201903010000012200845152540736777****1313172712MARCOS PEREIRAMERCADO DA AVENIDA\n", 
      "1201903010000011200096206760173648****0099234234JOÃO MACEDO   BAR DO JOÃO       \n"
    ]
  }

  let(:invalid_file){
    [
      "A201903010000014200096206760174753****3153153453JOÃO MACEDO   BAR DO JOÃO       \n", 
      "155201903010000013200556418150633123****768714560887MARIA JOSEFINALOJA DO Ó - MATRIZ\n", 
      "1201A03010000012200845152540736777****1313172712MARCOS PEREIRAMERCADO DA AVENIDA\n", 
      "2201903010000011200096206760173648****009923J234JOÃO MACEDO   BAR DO JOÃO       \n"
    ]
  }

  let!(:transaction_type_positive) { create(:transaction_type_positive) }
  let!(:transaction_type_negative) { create(:transaction_type_negative ) }

  context 'validate file interpretation service' do

    let!(:cnab_importation) { create(:cnab_importation, file: valid_file) }

    it 'must return the cnab importation created' do

      InterpretFileService.build(cnab_importation.id)

      cnab_importation = CnabImportation.last

      expect(CnabImportation.count).to eq(1)

      expect(cnab_importation.status).to eq("concluded")
      expect(cnab_importation.file["results"].count).to eq(4)

      expect(cnab_importation.file["results"][0]["status"]).to be_truthy
      expect(cnab_importation.file["results"][0]["line"]).to eq(1)
      expect(cnab_importation.file["results"][0]["cpf"]).to be_truthy
      expect(cnab_importation.file["results"][0]["date"]).to be_truthy
      expect(cnab_importation.file["results"][0]["time"]).to be_truthy
      expect(cnab_importation.file["results"][0]["amount"]).to be_truthy
      expect(cnab_importation.file["results"][0]["status"]).to be_truthy
      expect(cnab_importation.file["results"][0]["store_name"]).to be_truthy
      expect(cnab_importation.file["results"][0]["card_number"]).to be_truthy
      expect(cnab_importation.file["results"][0]["store_owner"]).to be_truthy
      expect(cnab_importation.file["results"][0]["transaction_type"]).to be_truthy
      expect(cnab_importation.file["results"][0]["record"]).to eq("1201903010000014200096206760174753****3153153453JOÃO MACEDO   BAR DO JOÃO       \n")

      expect(cnab_importation.file["results"][1]["status"]).to be_truthy
      expect(cnab_importation.file["results"][1]["line"]).to eq(2)
      expect(cnab_importation.file["results"][1]["cpf"]).to be_truthy
      expect(cnab_importation.file["results"][1]["date"]).to be_truthy
      expect(cnab_importation.file["results"][1]["time"]).to be_truthy
      expect(cnab_importation.file["results"][1]["amount"]).to be_truthy
      expect(cnab_importation.file["results"][1]["status"]).to be_truthy
      expect(cnab_importation.file["results"][1]["store_name"]).to be_truthy
      expect(cnab_importation.file["results"][1]["card_number"]).to be_truthy
      expect(cnab_importation.file["results"][1]["store_owner"]).to be_truthy
      expect(cnab_importation.file["results"][1]["transaction_type"]).to be_truthy
      expect(cnab_importation.file["results"][1]["record"]).to eq("2201903010000013200556418150633123****7687145607MARIA JOSEFINALOJA DO Ó - MATRIZ\n")

    end

    it 'must return three stores created' do

      InterpretFileService.build(cnab_importation.id)

      expect(Store.count).to eq(3)
      expect(Store.first.name).to eq("BAR DO JOÃO")
      expect(Store.first.owner).to eq("JOÃO MACEDO")
      expect(Store.second.name).to eq("LOJA DO Ó - MATRIZ")
      expect(Store.second.owner).to eq("MARIA JOSEFINA")
      expect(Store.last.name).to eq("MERCADO DA AVENIDA")
      expect(Store.last.owner).to eq("MARCOS PEREIRA")

    end

    it 'must return four transactions created' do

      InterpretFileService.build(cnab_importation.id)

      expect(Transaction.count).to eq(4)

      expect(Transaction.first.date.strftime("%Y-%m-%d %H:%M:%S")).to eq("2019-03-01 12:34:53")
      expect(Transaction.first.amount.to_f).to eq(142)
      expect(Transaction.first.cpf).to eq("09620676017")
      expect(Transaction.first.card_number).to eq("4753****3153")

      expect(Transaction.second.date.strftime("%Y-%m-%d %H:%M:%S")).to eq("2019-03-01 11:56:07")
      expect(Transaction.second.amount.to_f).to eq(132)
      expect(Transaction.second.cpf).to eq("55641815063")
      expect(Transaction.second.card_number).to eq("3123****7687")

      expect(Transaction.third.date.strftime("%Y-%m-%d %H:%M:%S")).to eq("2019-03-01 14:27:12")
      expect(Transaction.third.amount.to_f).to eq(122)
      expect(Transaction.third.cpf).to eq("84515254073")
      expect(Transaction.third.card_number).to eq("6777****1313")

      expect(Transaction.last.date.strftime("%Y-%m-%d %H:%M:%S")).to eq("2019-03-01 20:42:34")
      expect(Transaction.last.amount.to_f).to eq(112)
      expect(Transaction.last.cpf).to eq("09620676017")
      expect(Transaction.last.card_number).to eq("3648****0099")

    end

  end

  context 'invalid file interpretation service' do

    let!(:cnab_importation) { create(:cnab_importation, file: invalid_file) }

    it 'must return the cnab importation created' do

      InterpretFileService.build(cnab_importation.id)

      cnab_importation = CnabImportation.last

      expect(CnabImportation.count).to eq(1)

      expect(cnab_importation.status).to eq("failed")
      expect(cnab_importation.file["results"].count).to eq(4)

      expect(cnab_importation.file["results"][0]["status"]).to be_falsy
      expect(cnab_importation.file["results"][0]["transaction_type"]).to be_falsy
      expect(cnab_importation.file["results"][0]["line"]).to eq(1)
      expect(cnab_importation.file["results"][0]["cpf"]).to be_truthy
      expect(cnab_importation.file["results"][0]["date"]).to be_truthy
      expect(cnab_importation.file["results"][0]["time"]).to be_truthy
      expect(cnab_importation.file["results"][0]["amount"]).to be_truthy
      expect(cnab_importation.file["results"][0]["store_name"]).to be_truthy
      expect(cnab_importation.file["results"][0]["card_number"]).to be_truthy
      expect(cnab_importation.file["results"][0]["store_owner"]).to be_truthy
      expect(cnab_importation.file["results"][0]["record"]).to eq("A201903010000014200096206760174753****3153153453JOÃO MACEDO   BAR DO JOÃO       \n")

      expect(cnab_importation.file["results"][1]["status"]).to be_falsy
      expect(cnab_importation.file["results"][1]["info"]).to be_truthy
      expect(cnab_importation.file["results"][1]["line"]).to eq(2)
      expect(cnab_importation.file["results"][1]["record"]).to eq("155201903010000013200556418150633123****768714560887MARIA JOSEFINALOJA DO Ó - MATRIZ\n")
      
      expect(cnab_importation.file["results"][2]["status"]).to be_falsy
      expect(cnab_importation.file["results"][2]["date"]).to be_falsy
      expect(cnab_importation.file["results"][2]["line"]).to eq(3)
      expect(cnab_importation.file["results"][2]["transaction_type"]).to be_truthy
      expect(cnab_importation.file["results"][2]["cpf"]).to be_truthy
      expect(cnab_importation.file["results"][2]["time"]).to be_truthy
      expect(cnab_importation.file["results"][2]["amount"]).to be_truthy
      expect(cnab_importation.file["results"][2]["store_name"]).to be_truthy
      expect(cnab_importation.file["results"][2]["card_number"]).to be_truthy
      expect(cnab_importation.file["results"][2]["store_owner"]).to be_truthy
      expect(cnab_importation.file["results"][2]["record"]).to eq("1201A03010000012200845152540736777****1313172712MARCOS PEREIRAMERCADO DA AVENIDA\n")

      expect(cnab_importation.file["results"][3]["status"]).to be_falsy
      expect(cnab_importation.file["results"][3]["time"]).to be_falsy
      expect(cnab_importation.file["results"][3]["line"]).to eq(4)
      expect(cnab_importation.file["results"][3]["date"]).to be_truthy
      expect(cnab_importation.file["results"][3]["transaction_type"]).to be_truthy
      expect(cnab_importation.file["results"][3]["cpf"]).to be_truthy
      expect(cnab_importation.file["results"][3]["amount"]).to be_truthy
      expect(cnab_importation.file["results"][3]["store_name"]).to be_truthy
      expect(cnab_importation.file["results"][3]["card_number"]).to be_truthy
      expect(cnab_importation.file["results"][3]["store_owner"]).to be_truthy
      expect(cnab_importation.file["results"][3]["record"]).to eq("2201903010000011200096206760173648****009923J234JOÃO MACEDO   BAR DO JOÃO       \n")

    end

    it 'must not return stores created' do

      InterpretFileService.build(cnab_importation.id)

      expect(Store.count).to eq(0)

    end

    it 'must not return transactions created' do

      InterpretFileService.build(cnab_importation.id)

      expect(Transaction.count).to eq(0)

    end

  end

end