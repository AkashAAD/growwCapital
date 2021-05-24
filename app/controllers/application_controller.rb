class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,
			:last_name,
			:email,
			:mobile_number,
			:password,
			:password_confirmation])
	end

  def after_sign_in_path_for(resource)
    home_profile_path
  end

end
