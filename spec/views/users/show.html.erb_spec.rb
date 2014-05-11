require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :provider => "Provider",
      :uid => "Uid",
      :name => "Name",
      :email => "Email",
      :oauth_token => "Oauth Token",
      :identity_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Provider/)
    expect(rendered).to match(/Uid/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Oauth Token/)
    expect(rendered).to match(/1/)
  end
end
