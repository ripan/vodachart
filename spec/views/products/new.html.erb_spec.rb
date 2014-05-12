require 'spec_helper'

describe "products/new" do
  before(:each) do
    assign(:product, stub_model(Product,
      :name => "MyString",
      :product_family_id => 1
    ).as_new_record)
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do
      assert_select "input#product_name[name=?]", "product[name]"
      assert_select "input#product_product_family_id[name=?]", "product[product_family_id]"
    end
  end
end
