class UsersController < ApplicationController
  before_filter :require_no_user, :except => [:edit, :update]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      login(params[:user][:email], params[:user][:password])
      redirect_to root_url, :notice => "Successfully signed up!"
    else
      render :new
    end
  end
end
