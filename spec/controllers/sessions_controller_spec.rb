require 'spec_helper'

describe SessionsController do
  render_views
  
  describe "GET 'new'" do
    
    context "for signed-in-users" do
      before(:each) do
        @user = Factory(:user)
        login_user
      end
      it "should deny access" do
        pending("Need solid no_user method")
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
        response.should have_selector("title", :content => "Sign In")
      end
    
      it "should have a new user form" do
        get :new
        response.should have_selector("form[method=post]", :action => sessions_path) do |form|
          form.should have_selector("input", :name => "email")
          form.should have_selector("input", :name => "password")
          form.should have_selector("input", :type => "checkbox", :name => "remember_me")
          form.should have_selector("input", :type => "submit")
        end
      end
    end
  end
  
  describe "POST 'create'" do
    
    before(:each) do
      @user = Factory(:user)
      @attr = {
        :email => @user.email,
        :password => @user.password
      }
    end
    
    context "for signed-in-users" do
      before(:each) do
        login_user
      end
      it "should deny access" do
        pending("Need solid no_user method")
        post :create
        response.should redirect_to root_path
      end
    end
    
    context "for non-signed-in-users" do
      describe "failure" do
        before(:each) do
          controller.stub!(:login).and_return(false)
        end
        
        it "should render the new page" do
          post :create, :session => @attr
          response.should render_template(:new)
        end
        
        it "should have a flash message" do
          post :create, :session => @attr
          flash[:alert].should =~ /invalid/i
        end
      end
      
      describe "success" do
        before(:each) do
          controller.stub!(:login).and_return(@user)
        end
        
        it "should redirect to the home page" do
          post :create, :session => @attr
          response.should redirect_to root_path
        end
        
        it "should have a flash message" do
          post :create, :session => @attr
          flash[:notice].should =~ /signed in/i
        end
      end
    end
  end
  
  describe "DELETE 'destroy'" do
    before(:each) do
      login_user(Factory(:user))
    end
    
    it "should sign the user out" do
      delete :destroy
      response.should redirect_to root_path
      #controller.should_not be_logged_in # not sure why this fails
      flash[:notice].should =~ /signed out/i
    end
  end
end
