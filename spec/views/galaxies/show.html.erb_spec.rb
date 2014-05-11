require 'spec_helper'

describe "galaxies/show" do
  before(:each) do
    @galaxy = assign(:galaxy, stub_model(Galaxy,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
