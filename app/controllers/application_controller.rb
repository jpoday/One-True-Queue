class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
    def not_authenticated
      redirect_to signin_path, :alert => "First log in to view this page."
    end
    
    def require_no_user
      if current_user
        redirect_to root_path, :alert => "You must be signed out for that action."
      end
    end
end
