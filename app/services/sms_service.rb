class SmsService
  def initialize
  	# @api_key = Rails.application.config.TOOKAN_API_KEY
  	# @user_id = Rails.application.config.TOOKAN_USER_ID
  	# @api_url = Rails.application.config.TOOKAN_API_URL
  end

	def send_otp(mobile_number)
		
	end

	def send_preapproved_otp(pre_approved_offer, otp)
		message = "Dear #{pre_approved_offer[:first_name]} #{pre_approved_offer[:last_name]}, Your preappoved offer otp is #{otp}. Please do not share this otp to with anyone. Growwcapital executive don't ask for an otp."
		thread = "#{Rails.application.config.SMS_URL}&numbers=#{pre_approved_offer[:mobile_no]}&message=#{message}"
		request = RestClient.get("#{thread}")
	end
end