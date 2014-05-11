require "spec_helper"

describe AliensController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/aliens").to route_to("aliens#index")
    end

    it "routes to #new" do
      expect(:get => "/aliens/new").to route_to("aliens#new")
    end

    it "routes to #show" do
      expect(:get => "/aliens/1").to route_to("aliens#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/aliens/1/edit").to route_to("aliens#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/aliens").to route_to("aliens#create")
    end

    it "routes to #update" do
      expect(:put => "/aliens/1").to route_to("aliens#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/aliens/1").to route_to("aliens#destroy", :id => "1")
    end

  end
end
