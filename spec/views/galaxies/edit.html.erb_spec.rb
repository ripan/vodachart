require 'spec_helper'

describe "galaxies/edit" do
  before(:each) do
    @galaxy = assign(:galaxy, stub_model(Galaxy,
      :name => "MyString"
    ))
  end

  it "renders the edit galaxy form" do
    render

    assert_select "form[action=?][method=?]", galaxy_path(@galaxy), "post" do
      assert_select "input#galaxy_name[name=?]", "galaxy[name]"
    end
  end
end
