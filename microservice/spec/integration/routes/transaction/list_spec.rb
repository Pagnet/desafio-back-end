require "rails_helper"

RSpec.describe "Transactions route", :type => :routing do
  it "should execute the GET /transactions" do
    expect(get("/transactions")).
      to route_to("transactions#list")
  end
end
