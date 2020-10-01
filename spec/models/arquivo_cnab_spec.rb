require 'rails_helper'

RSpec.describe ArquivoCnab, type: :model do
	context "validacoes" do
		it "Nao pode ficar em branco" do
			arquivo = ArquivoCnab.new
			arquivo.save
			expect(arquivo.errors.messages).to eq(:documento=>["não pode ficar em branco"])
		end

		it "nao deve ser aceita extensoes diferences de txt" do
			arquivo = ArquivoCnab.new({
				documento: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/support/arquivos/arquivo_cnabs/CNAB.md'), "text/plain")
			})
			arquivo.save
			expect(arquivo.errors.messages).to eq(:documento => ["extensão inválida", "não pode ficar em branco"])

		end
	end
end
