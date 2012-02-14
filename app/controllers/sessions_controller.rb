class SessionsController < ApplicationController
  before_filter :require_no_user, :except => :destroy
  
  def new
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_back_or_to root_path, :notice => "Successfully signed in!"
    else
      flash.now[:alert] = "Email or password was invalid"
      render :new
    end
  end
  
  def destroy
    logout
    redirect_to root_url, :notice => "Successfully signed out!"
  end
end
