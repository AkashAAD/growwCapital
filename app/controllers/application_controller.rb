class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :apply_now

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,
			:last_name,
			:email,
			:mobile_number,
			:password,
			:password_confirmation])
	end

	def apply_now
		@instant_call = InstantCall.new
	end

  def after_sign_in_path_for(resource)
    home_profile_path
  end

end
