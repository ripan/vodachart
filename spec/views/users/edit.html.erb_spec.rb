require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :provider => "MyString",
      :uid => "MyString",
      :name => "MyString",
      :email => "MyString",
      :oauth_token => "MyString",
      :identity_id => 1
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do
      assert_select "input#user_provider[name=?]", "user[provider]"
      assert_select "input#user_uid[name=?]", "user[uid]"
      assert_select "input#user_name[name=?]", "user[name]"
      assert_select "input#user_email[name=?]", "user[email]"
      assert_select "input#user_oauth_token[name=?]", "user[oauth_token]"
      assert_select "input#user_identity_id[name=?]", "user[identity_id]"
    end
  end
end
