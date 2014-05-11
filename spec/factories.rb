FactoryGirl.define do

  sequence(:random_string) {|n| rand(32**10).to_s(32) }
  sequence(:random_number) {|n| rand(32**10) }
  
  factory :user do
    name { generate(:random_string) }
    email {"#{name}@vc.com"}
    uid  { generate(:random_string) }
    provider  { generate(:random_string) }
  end

  factory :role do
    name "Admin"
  end
  

end
