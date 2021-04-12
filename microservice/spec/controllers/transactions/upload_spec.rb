require "rails_helper"

RSpec.describe TransactionsController, type: :controller do
  describe "upload" do
    it "call import_cnab method" do
      allow(Transaction).to receive(:import_cnab)

      file = Rack::Test::UploadedFile.new(
        "#{Rails.root}/spec/support/attachments/CNAB.txt",
        "application/txt"
      )

      post "upload", params: { file: file }

      expect(Transaction).to have_received(:import_cnab)

      expect(response.status).to eq(200)
    end
  end
end
