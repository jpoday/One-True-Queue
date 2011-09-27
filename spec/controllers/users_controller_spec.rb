require 'spec_helper'

describe UsersController do
  render_views
  
  describe "GET 'new'" do
    context "for signed-in users" do
      before(:each) do
        login_user(Factory(:user))
      end
      
      it "should deny access" do
        get :new
        response.should redirect_to root_path
      end
    end
    
    context "for non-signed-in users" do    
      it "should be successful" do
        get :new
        response.should be_success
      end
    
      it "should render the 'new' template" do
        get :new
        response.should render_template(:new)
      end
          
      it "should have the right title" do
        get :new
        response.should have_selector("title", :content => "Sign Up")
      end
    
      it "should have a new user form" do
        get :new
        response.should have_selector("form[method=post]", :action => users_path) do |form|
          form.should have_selector("input", :name => "user[name]")
          form.should have_selector("input", :name => "user[email]")
          form.should have_selector("input", :name => "user[password]")
          form.should have_selector("input", :name => "user[password_confirmation]")
          form.should have_selector("input", :type => "submit")
        end
      end
    end
  end
  
  describe "POST 'create'" do
    context "for signed-in users" do
      before(:each) do
        login_user(Factory(:user))
      end
      
      it "should deny access" do
        post :create
        response.should redirect_to root_path
      end
    end
    
    context "for non-signed-in users" do    
      before(:each) do
        @attr = {
          :name => "Joseph O'Day",
          :email => "joe@example.com",
          :password => "password",
          :password_confirmation => "password"
        }
        @user = Factory(:user, @attr)
        User.stub!(:new).and_return(@user)
      end
      
      describe "failure" do
        before(:each) do
          @user.stub!(:save).and_return(false)
        end
        
        it "should render the new page" do
          post :create, :user => @attr
          response.should render_template(:new)
        end
      end
      
      describe "success" do
        before(:each) do
          @user.stub!(:save).and_return(true)
        end
        
        it "should redirect to the home page" do
          post :create, :user => @attr
          response.should redirect_to root_path
        end
        
        it "should have a flash message" do
          post :create, :user => @attr
          flash[:notice].should =~ /successfully signed up/i
        end
        
        it "should sign the user in" do
          post :create, :user => @attr
          controller.current_user == @user
        end
      end
    end
  end
end
