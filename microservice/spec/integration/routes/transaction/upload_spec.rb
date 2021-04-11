require "rails_helper"

RSpec.describe "Transactions routes", :type => :routing do
  it "should execute the POST /transactions/upload route" do
    expect(post("/transactions/upload")).
      to route_to("transactions#upload")
  end
end

RSpec.describe "Transaction file upload", :type => :request do
  it "should create transactions from cnab file" do
    post "/transactions/upload", :params => { :file => "cnab.txt" }

    expect(response.body).to include("File uploaded successfully")
  end
end
