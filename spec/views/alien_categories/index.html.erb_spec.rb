require 'spec_helper'

describe "alien_categories/index" do
  before(:each) do
    assign(:alien_categories, [
      stub_model(AlienCategory,
        :name => "Name"
      ),
      stub_model(AlienCategory,
        :name => "Name"
      )
    ])
  end

  it "renders a list of alien_categories" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
