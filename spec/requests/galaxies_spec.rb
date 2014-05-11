require 'spec_helper'

describe "Galaxies" do
  describe "GET /galaxies" do
    it "works! (now write some real specs)" do
      get galaxies_path
      expect(response.status).to be(200)
    end
  end
end
