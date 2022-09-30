require "rails_helper"

RSpec.describe TunnelsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/tunnels").to route_to("tunnels#index")
    end

    it "routes to #new" do
      expect(get: "/tunnels/new").to route_to("tunnels#new")
    end

    it "routes to #show" do
      expect(get: "/tunnels/1").to route_to("tunnels#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/tunnels/1/edit").to route_to("tunnels#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/tunnels").to route_to("tunnels#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/tunnels/1").to route_to("tunnels#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/tunnels/1").to route_to("tunnels#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/tunnels/1").to route_to("tunnels#destroy", id: "1")
    end
  end
end
