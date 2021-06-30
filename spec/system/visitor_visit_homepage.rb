require 'rails_helper'

describe 'Visitor visit homepage' do
    it "- Should be able access homepage" do
        visit root_path

        expect(current_path).to eq(root_path)
        expect(page).to have_text("Analisador de arquivos CNAB")
        expect(page).to have_text("Faça upload do arquivo para análise")
        expect(page).to have_css('input#cnab_input')    
        expect(page).to have_button("Enviar")    
    end
    
end