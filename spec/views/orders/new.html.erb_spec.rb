require 'spec_helper'

describe "orders/new" do
  before(:each) do
    assign(:order, stub_model(Order,
      :alien_id => 1,
      :product_id => 1,
      :stage_id => 1,
      :is_closed => false,
      :setup_charge => "9.99",
      :monthly_revenue => "9.99"
    ).as_new_record)
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do
      assert_select "input#order_alien_id[name=?]", "order[alien_id]"
      assert_select "input#order_product_id[name=?]", "order[product_id]"
      assert_select "input#order_stage_id[name=?]", "order[stage_id]"
      assert_select "input#order_is_closed[name=?]", "order[is_closed]"
      assert_select "input#order_setup_charge[name=?]", "order[setup_charge]"
      assert_select "input#order_monthly_revenue[name=?]", "order[monthly_revenue]"
    end
  end
end
