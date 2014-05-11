require 'spec_helper'

describe User do

  before do
    @user = FactoryGirl.build(:user)
  end
  
  subject { @user }

  it "should respond to 'name'" do
    expect(@user).to respond_to(:name)
  end
  
  it "should respond to 'email'" do
    expect(@user).to respond_to(:email)
  end
  
  context 'is invalid if' do
    it "email is not present" do
      @user.email = ""
      expect(@user).to be_invalid
    end

    it "provider is not present" do
      @user.provider = ""
      expect(@user).to be_invalid
    end
  end
  
end
