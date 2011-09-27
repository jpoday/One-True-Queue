require 'spec_helper'

describe User do
  before(:each) do
    @attr = {
      :name => "Joseph O'Day",
      :email => "joe@example.com",
      :password => "password",
      :password_confirmation => "password"
    }
  end
  
  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end
  
  context "validations" do
    it "should require a name" do
      no_name_user = User.new(@attr.merge(:name => ""))
      no_name_user.should_not be_valid
    end
    
    it "should require an email" do
      no_email_user = User.new(@attr.merge(:email => ""))
      no_email_user.should_not be_valid
    end
    
    it "should require a password" do
      no_pass_user = User.new(@attr.merge(:password => ""))
      no_pass_user.should_not be_valid
    end
    
    it "should require a password confirmation" do
      no_confirm_user = User.new(@attr.merge(:password_confirmation => ""))
      no_confirm_user.should_not be_valid
    end
    
    it "should require a unique email" do
      User.create(@attr)
      dup_user = User.new(@attr.merge(:name => "Another"))
      dup_user.should_not be_valid
    end
  end
end
