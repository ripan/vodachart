require 'spec_helper'

describe "galaxies/index" do
  before(:each) do
    assign(:galaxies, [
      stub_model(Galaxy,
        :name => "Name"
      ),
      stub_model(Galaxy,
        :name => "Name"
      )
    ])
  end

  it "renders a list of galaxies" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
