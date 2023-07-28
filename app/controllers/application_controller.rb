class ApplicationController < ActionController::Base
  before_action :configure_user_new_permitted_parameters, if: :devise_controller?
  before_action :configure_user_update_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    users_dash_boards_path
  end

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
