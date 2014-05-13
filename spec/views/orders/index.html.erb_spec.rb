require 'spec_helper'

describe "orders/index" do
  before(:each) do
    assign(:orders, [
      stub_model(Order,
        :alien_id => 1,
        :product_id => 2,
        :stage_id => 3,
        :is_closed => false,
        :setup_charge => "9.99",
        :monthly_revenue => "9.99"
      ),
      stub_model(Order,
        :alien_id => 1,
        :product_id => 2,
        :stage_id => 3,
        :is_closed => false,
        :setup_charge => "9.99",
        :monthly_revenue => "9.99"
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
