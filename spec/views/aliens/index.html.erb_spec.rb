require 'spec_helper'

describe "aliens/index" do
  before(:each) do
    assign(:aliens, [
      stub_model(Alien,
        :name => "Name",
        :alien_category_id => 1,
        :planet_id => 2
      ),
      stub_model(Alien,
        :name => "Name",
        :alien_category_id => 1,
        :planet_id => 2
      )
    ])
  end

  it "renders a list of aliens" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
