require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :provider => "MyString",
      :uid => "MyString",
      :name => "MyString",
      :email => "MyString",
      :oauth_token => "MyString",
      :identity_id => 1
    ).as_new_record)
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input#user_provider[name=?]", "user[provider]"
      assert_select "input#user_uid[name=?]", "user[uid]"
      assert_select "input#user_name[name=?]", "user[name]"
      assert_select "input#user_email[name=?]", "user[email]"
      assert_select "input#user_oauth_token[name=?]", "user[oauth_token]"
      assert_select "input#user_identity_id[name=?]", "user[identity_id]"
    end
  end
end
