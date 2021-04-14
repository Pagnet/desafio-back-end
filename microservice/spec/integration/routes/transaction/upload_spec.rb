require "rails_helper"

RSpec.describe "Transactions routes", :type => :routing do
  it "should execute the POST /transactions/upload route" do
    expect(post("/transactions/upload")).
      to route_to("transactions#upload")
  end
end

RSpec.describe "Transaction file upload request", :type => :request do
  it "should execute controller upload method" do
    file = Rack::Test::UploadedFile.new(
      "#{Rails.root}/spec/support/attachments/CNAB.txt",
      "application/txt"
    )

    @expected = { message: "File uploaded successfully" }

    post "/transactions/upload", params: { transaction: { :file => file } }

    expect(response.body).to eq(@expected.to_json)
    expect(response.status).to eq(200)
  end
end
