require 'spec_helper'

describe "aliens/edit" do
  before(:each) do
    @alien = assign(:alien, stub_model(Alien,
      :name => "MyString",
      :alien_category_id => 1,
      :planet_id => 1
    ))
  end

  it "renders the edit alien form" do
    render

    assert_select "form[action=?][method=?]", alien_path(@alien), "post" do
      assert_select "input#alien_name[name=?]", "alien[name]"
      assert_select "input#alien_alien_category_id[name=?]", "alien[alien_category_id]"
      assert_select "input#alien_planet_id[name=?]", "alien[planet_id]"
    end
  end
end
