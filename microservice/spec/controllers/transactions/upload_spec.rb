require "rails_helper"

RSpec.describe TransactionsController, type: :controller do
  describe "upload" do
    it "call use case to upload cnab" do
      allow(Transactions::Import).to receive(:execute)

      file = Rack::Test::UploadedFile.new(
        "#{Rails.root}/spec/support/attachments/CNAB.txt",
        "application/txt"
      )

      post "upload", params: { transaction: { file: file } }

      expect(Transactions::Import).to have_received(:execute)

      expect(response.status).to eq(200)
    end
  end
end
