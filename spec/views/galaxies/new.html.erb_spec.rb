require 'spec_helper'

describe "galaxies/new" do
  before(:each) do
    assign(:galaxy, stub_model(Galaxy,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new galaxy form" do
    render

    assert_select "form[action=?][method=?]", galaxies_path, "post" do
      assert_select "input#galaxy_name[name=?]", "galaxy[name]"
    end
  end
end
