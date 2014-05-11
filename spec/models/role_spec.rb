require 'spec_helper'

describe Role do
   before do
    @role = FactoryGirl.build(:role)
  end
  
  subject { @role }

  it "should respond to 'name'" do
    expect(@role).to respond_to(:name)
  end
end
