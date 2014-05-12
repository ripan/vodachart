require 'spec_helper'

describe "product_families/show" do
  before(:each) do
    @product_family = assign(:product_family, stub_model(ProductFamily,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
