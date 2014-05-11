require 'spec_helper'

describe "Aliens" do
  describe "GET /aliens" do
    it "works! (now write some real specs)" do
      get aliens_path
      expect(response.status).to be(200)
    end
  end
end
