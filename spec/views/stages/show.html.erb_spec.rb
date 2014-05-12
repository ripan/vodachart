require 'spec_helper'

describe "stages/show" do
  before(:each) do
    @stage = assign(:stage, stub_model(Stage,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
