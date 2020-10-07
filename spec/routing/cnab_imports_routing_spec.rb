require "rails_helper"

RSpec.describe CnabImportsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/cnab_imports").to route_to("cnab_imports#index")
    end

    it "routes to #new" do
      expect(get: "/cnab_imports/new").to route_to("cnab_imports#new")
    end

    it "routes to #show" do
      expect(get: "/cnab_imports/1").to route_to("cnab_imports#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/cnab_imports/1/edit").to route_to("cnab_imports#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/cnab_imports").to route_to("cnab_imports#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/cnab_imports/1").to route_to("cnab_imports#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/cnab_imports/1").to route_to("cnab_imports#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/cnab_imports/1").to route_to("cnab_imports#destroy", id: "1")
    end
  end
end
