require 'spec_helper'

describe "planets/show" do
  before(:each) do
    @planet = assign(:planet, stub_model(Planet,
      :name => "Name",
      :galaxy_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
  end
end
