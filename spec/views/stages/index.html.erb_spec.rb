require 'spec_helper'

describe "stages/index" do
  before(:each) do
    assign(:stages, [
      stub_model(Stage,
        :name => "Name"
      ),
      stub_model(Stage,
        :name => "Name"
      )
    ])
  end

  it "renders a list of stages" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
