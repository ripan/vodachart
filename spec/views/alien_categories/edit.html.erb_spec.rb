require 'spec_helper'

describe "alien_categories/edit" do
  before(:each) do
    @alien_category = assign(:alien_category, stub_model(AlienCategory,
      :name => "MyString"
    ))
  end

  it "renders the edit alien_category form" do
    render

    assert_select "form[action=?][method=?]", alien_category_path(@alien_category), "post" do
      assert_select "input#alien_category_name[name=?]", "alien_category[name]"
    end
  end
end
