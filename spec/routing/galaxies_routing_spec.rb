require "spec_helper"

describe GalaxiesController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/galaxies").to route_to("galaxies#index")
    end

    it "routes to #new" do
      expect(:get => "/galaxies/new").to route_to("galaxies#new")
    end

    it "routes to #show" do
      expect(:get => "/galaxies/1").to route_to("galaxies#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/galaxies/1/edit").to route_to("galaxies#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/galaxies").to route_to("galaxies#create")
    end

    it "routes to #update" do
      expect(:put => "/galaxies/1").to route_to("galaxies#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/galaxies/1").to route_to("galaxies#destroy", :id => "1")
    end

  end
end
