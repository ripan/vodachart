require 'spec_helper'

describe "planets/edit" do
  before(:each) do
    @planet = assign(:planet, stub_model(Planet,
      :name => "MyString",
      :galaxy_id => 1
    ))
  end

  it "renders the edit planet form" do
    render

    assert_select "form[action=?][method=?]", planet_path(@planet), "post" do
      assert_select "input#planet_name[name=?]", "planet[name]"
      assert_select "input#planet_galaxy_id[name=?]", "planet[galaxy_id]"
    end
  end
end
