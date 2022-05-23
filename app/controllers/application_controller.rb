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
		@refer_earn = ReferEarn.new
	end

  def check_admin_manager
    return redirect_to root_path unless current_user.sales_manager? || current_user.admin? || current_user.accountant?
  end

  def check_sales_manager
    redirect_to '/sales-manager' if current_user.accountant?
  end

  def check_accountant
    return redirect_to root_path unless current_user.accountant? || current_user.admin?
  end

  def after_sign_in_path_for(resource)
    return rails_admin_path if resource.admin?
    return '/sales-manager' if resource.sales_manager? || resource.accountant?
    home_profile_path
  end

end
