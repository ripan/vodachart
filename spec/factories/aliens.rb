# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :alien do
    name "MyString"
    alien_category_id 1
    planet_id 1
  end
end
