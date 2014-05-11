require 'spec_helper'

describe "aliens/show" do
  before(:each) do
    @alien = assign(:alien, stub_model(Alien,
      :name => "Name",
      :alien_category_id => 1,
      :planet_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
