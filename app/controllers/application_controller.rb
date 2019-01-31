class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? 
    
  protected
    def authenticated_user!
      if user_signed_in?
        authenticate_user!
      else
        redirect_to new_user_session_path
      end
    end 
    
    def configure_permitted_parameters
      added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
end
