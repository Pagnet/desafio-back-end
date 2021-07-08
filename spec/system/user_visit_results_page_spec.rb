require 'rails_helper'

describe 'Visitor upload cnab file' do

    it "- Should be able view results page" do
        visit transaction_results_path
        
        expect(current_path).to eq(transaction_results_path)
        expect(page).to have_text("Lista das operações importadas")
        expect(page).to have_text("Loja")
        expect(page).to have_text("Saldo em conta")    
    end

    it "- Should be able view results page with store info" do
        visit root_path
        attach_file 'cnab_input', Rails.root.join('CNAB.txt')
        click_on 'Enviar'
            
        expect(current_path).to eq(transaction_results_path)
        expect(page).to have_text("Importado com sucesso !")
        expect(page).to have_text("Lista das operações importadas")
        expect(page).to have_text("Loja")
        expect(page).to have_text("BAR DO JOÃO")
        expect(page).to have_text("LOJA DO Ó - MATRIZ")
        expect(page).to have_text("MERCADO DA AVENIDA")
        expect(page).to have_text("MERCEARIA 3 IRMÃOS")
        
        expect(page).to have_text("Saldo em conta")    
        expect(page).to have_text("(R$ 102,00)")
        expect(page).to have_text("R$ 152,32")
        expect(page).to have_text("R$ 230,00")
        expect(page).to have_text("R$ 489,20")
        expect(page).to have_text("(R$ 7.023,00)")
    end

    it "- Should be able view store transactions details" do
        visit root_path
        attach_file 'cnab_input', Rails.root.join('CNAB.txt')
        click_on 'Enviar'
            
        expect(current_path).to eq(transaction_results_path)
        expect(page).to have_text("BAR DO JOÃO")
        expect(page).to have_text("JOÃO MACEDO")

        expect(page).to have_text("LOJA DO Ó - FILIAL")
        expect(page).to have_text("MARIA JOSEFINA")

        expect(page).to have_text("MERCADO DA AVENIDA")
        expect(page).to have_text("MARCOS PEREIRA")

        expect(page).to have_text("MERCEARIA 3 IRMÃOS")
        expect(page).to have_text("JOSÉ COSTA")    
        
        expect(page).to have_text("(R$ 142,00)")
        expect(page).to have_text("R$ 132,00")
        expect(page).to have_text("R$ 200,00")
        expect(page).to have_text("R$ 506,17")
        expect(page).to have_text("(R$ 6.102,00)")
        
        expect(page).to have_text("10h 00min 00s")
        expect(page).to have_text("17h 27min 12s")
        expect(page).to have_text("14h 18min 08s")
        
        expect(page).to have_text("01/03/2019")
        
        expect(page).to have_text("1234****3324")
        expect(page).to have_text("6777****1313")
        expect(page).to have_text("4753****3153")

        expect(page).to have_text("financiamento")
        expect(page).to have_text("boleto")
        expect(page).to have_text("debito")
        expect(page).to have_text("credito")
        expect(page).to have_text("recebimento_emprestimo")
        expect(page).to have_text("aluguel")
        
        expect(page).to have_text("845.152.540-73")
        expect(page).to have_text("096.206.760-17")
        expect(page).to have_text("232.702.980-56")
        expect(page).to have_text("556.418.150-63")

    end
end