# Read about factories at https://github.com/thoughtbot/factory_girl

# FactoryGirl.define do
#   factory :user do
#     provider "MyString"
#     uid "MyString"
#     name "MyString"
#     email "MyString"
#     oauth_token "MyString"
#     identity_id 1
#     oauth_expires_at "2014-05-11 18:41:59"
#   end
# end


FactoryGirl.define do

  sequence(:random_string) {|n| rand(32**10).to_s(32) }
  sequence(:random_number) {|n| rand(32**10) }

  factory :user do
    provider { generate(:random_string) }
    uid { generate(:random_string) }
    name { generate(:random_string) }
    email {"#{name}@vc.com"}
    oauth_token { generate(:random_string) }
    oauth_expires_at "2014-05-11 18:41:59"
    uid  { generate(:random_string) }
  end

end
