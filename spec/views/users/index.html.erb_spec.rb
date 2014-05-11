require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :provider => "Provider",
        :uid => "Uid",
        :name => "Name",
        :email => "Email",
        :oauth_token => "Oauth Token",
        :identity_id => 1
      ),
      stub_model(User,
        :provider => "Provider",
        :uid => "Uid",
        :name => "Name",
        :email => "Email",
        :oauth_token => "Oauth Token",
        :identity_id => 1
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Provider".to_s, :count => 2
    assert_select "tr>td", :text => "Uid".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Oauth Token".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
