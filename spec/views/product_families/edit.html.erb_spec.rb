require 'spec_helper'

describe "product_families/edit" do
  before(:each) do
    @product_family = assign(:product_family, stub_model(ProductFamily,
      :name => "MyString"
    ))
  end

  it "renders the edit product_family form" do
    render

    assert_select "form[action=?][method=?]", product_family_path(@product_family), "post" do
      assert_select "input#product_family_name[name=?]", "product_family[name]"
    end
  end
end
