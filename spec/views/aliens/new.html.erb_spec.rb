require 'spec_helper'

describe "aliens/new" do
  before(:each) do
    assign(:alien, stub_model(Alien,
      :name => "MyString",
      :alien_category_id => 1,
      :planet_id => 1
    ).as_new_record)
  end

  it "renders new alien form" do
    render

    assert_select "form[action=?][method=?]", aliens_path, "post" do
      assert_select "input#alien_name[name=?]", "alien[name]"
      assert_select "input#alien_alien_category_id[name=?]", "alien[alien_category_id]"
      assert_select "input#alien_planet_id[name=?]", "alien[planet_id]"
    end
  end
end
