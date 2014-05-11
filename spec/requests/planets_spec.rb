require 'spec_helper'

describe "Planets" do
  describe "GET /planets" do
    it "works! (now write some real specs)" do
      get planets_path
      expect(response.status).to be(200)
    end
  end
end
