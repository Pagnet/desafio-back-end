require "rails_helper"

RSpec.describe "routes for transactions", :type => :routing do
  it "routes /transactions to the transactions controller" do
    expect(post("/transactions/upload")).
      to route_to("transactions#upload")
  end
end
