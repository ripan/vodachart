require 'spec_helper'

describe "alien_categories/show" do
  before(:each) do
    @alien_category = assign(:alien_category, stub_model(AlienCategory,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
