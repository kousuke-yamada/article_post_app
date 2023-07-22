class ApplicationController < ActionController::Base
  before_action :configure_user_new_permitted_parameters, if: :devise_controller?
  before_action :configure_user_update_permitted_parameters, if: :devise_controller?

  private
    # Sign up
    def configure_user_new_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

    # Edit User
    def configure_user_update_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end

end
