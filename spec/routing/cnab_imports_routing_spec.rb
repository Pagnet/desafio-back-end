require "rails_helper"

RSpec.describe CnabImportsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/cnab_imports").to route_to("cnab_imports#index")
    end

    it "routes to #new" do
      expect(get: "/cnab_imports/new").to route_to("cnab_imports#new")
    end

    it "routes to #create" do
      expect(post: "/cnab_imports").to route_to("cnab_imports#create")
    end
  end
end
