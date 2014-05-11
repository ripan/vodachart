require 'spec_helper'

describe "alien_categories/new" do
  before(:each) do
    assign(:alien_category, stub_model(AlienCategory,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new alien_category form" do
    render

    assert_select "form[action=?][method=?]", alien_categories_path, "post" do
      assert_select "input#alien_category_name[name=?]", "alien_category[name]"
    end
  end
end
