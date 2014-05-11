require 'spec_helper'

describe "planets/new" do
  before(:each) do
    assign(:planet, stub_model(Planet,
      :name => "MyString",
      :galaxy_id => 1
    ).as_new_record)
  end

  it "renders new planet form" do
    render

    assert_select "form[action=?][method=?]", planets_path, "post" do
      assert_select "input#planet_name[name=?]", "planet[name]"
      assert_select "input#planet_galaxy_id[name=?]", "planet[galaxy_id]"
    end
  end
end
