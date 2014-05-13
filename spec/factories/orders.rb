# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    alien_id 1
    product_id 1
    stage_id 1
    closed_at "2014-05-13 12:00:17"
    is_closed false
    setup_charge "9.99"
    monthly_revenue "9.99"
  end
end
