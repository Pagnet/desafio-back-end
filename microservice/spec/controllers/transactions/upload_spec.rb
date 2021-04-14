require "rails_helper"

RSpec.describe TransactionsController, type: :controller do
  describe "upload" do
    it "call use case to upload cnab" do
      allow(UseCases::Transactions::Import).to receive(:execute)

      file = Rack::Test::UploadedFile.new(
        "#{Rails.root}/spec/support/attachments/CNAB.txt",
        "application/txt"
      )

      post "upload", params: { transaction: { file: file } }

      expect(UseCases::Transactions::Import).to have_received(:execute)

      expect(response.status).to eq(200)
    end
  end
end
