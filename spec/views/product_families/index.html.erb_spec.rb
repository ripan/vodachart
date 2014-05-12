require 'spec_helper'

describe "product_families/index" do
  before(:each) do
    assign(:product_families, [
      stub_model(ProductFamily,
        :name => "Name"
      ),
      stub_model(ProductFamily,
        :name => "Name"
      )
    ])
  end

  it "renders a list of product_families" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
