require "rails_helper"

RSpec.describe WidgetsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/Widgets").to route_to("Widgets#index")
    end

    it "routes to #new" do
      expect(get: "/Widgets/new").to route_to("Widgets#new")
    end

    it "routes to #show" do
      expect(get: "/Widgets/1").to route_to("Widgets#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/Widgets/1/edit").to route_to("Widgets#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/Widgets").to route_to("Widgets#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/Widgets/1").to route_to("Widgets#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/Widgets/1").to route_to("Widgets#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/Widgets/1").to route_to("Widgets#destroy", id: "1")
    end
  end
end
