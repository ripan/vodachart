require 'spec_helper'

describe "planets/index" do
  before(:each) do
    assign(:planets, [
      stub_model(Planet,
        :name => "Name",
        :galaxy_id => 1
      ),
      stub_model(Planet,
        :name => "Name",
        :galaxy_id => 1
      )
    ])
  end

  it "renders a list of planets" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
