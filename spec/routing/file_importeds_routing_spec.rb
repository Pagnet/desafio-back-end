require "rails_helper"

RSpec.describe FileImportedsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/file_importeds").to route_to("file_importeds#index")
    end

    it "routes to #new" do
      expect(get: "/file_importeds/new").to route_to("file_importeds#new")
    end

    it "routes to #create" do
      expect(post: "/file_importeds").to route_to("file_importeds#create")
    end

    it "routes to #destroy" do
      expect(delete: "/file_importeds/1").to route_to("file_importeds#destroy", id: "1")
    end
  end
end
