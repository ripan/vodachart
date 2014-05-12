require 'spec_helper'

describe "product_families/new" do
  before(:each) do
    assign(:product_family, stub_model(ProductFamily,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new product_family form" do
    render

    assert_select "form[action=?][method=?]", product_families_path, "post" do
      assert_select "input#product_family_name[name=?]", "product_family[name]"
    end
  end
end
