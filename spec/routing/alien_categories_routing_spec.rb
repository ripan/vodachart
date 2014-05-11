require "spec_helper"

describe AlienCategoriesController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/alien_categories").to route_to("alien_categories#index")
    end

    it "routes to #new" do
      expect(:get => "/alien_categories/new").to route_to("alien_categories#new")
    end

    it "routes to #show" do
      expect(:get => "/alien_categories/1").to route_to("alien_categories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/alien_categories/1/edit").to route_to("alien_categories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/alien_categories").to route_to("alien_categories#create")
    end

    it "routes to #update" do
      expect(:put => "/alien_categories/1").to route_to("alien_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/alien_categories/1").to route_to("alien_categories#destroy", :id => "1")
    end

  end
end
