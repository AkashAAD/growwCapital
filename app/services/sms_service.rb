class SmsService
  def initialize
  	# @api_key = Rails.application.config.TOOKAN_API_KEY
  	# @user_id = Rails.application.config.TOOKAN_USER_ID
  	# @api_url = Rails.application.config.TOOKAN_API_URL
  end

	def send_otp(loan, loan_type)
		message = "Dear #{loan.first_name} #{loan.last_name}, Your #{loan_type} otp is #{loan.otp}. Do not share this with anyone. No Growwcapital employee will call and ask for your OTP. Call +91-88066-01122 if not requested by you."
		thread = "#{Rails.application.config.SMS_URL}&numbers=#{loan.mobile_number}&message=#{message}"
		request = RestClient.get("#{thread}")
		puts "#{request}"
	end

	def send_preapproved_otp(pre_approved_offer, otp)
		message = "Dear #{pre_approved_offer[:first_name]} #{pre_approved_offer[:last_name]}, Your preappoved offer otp is #{otp}. Do not share this with anyone. No Growwcapital employee will call and ask for your OTP. Call +91-88066-01122 if not requested by you."
		thread = "#{Rails.application.config.SMS_URL}&numbers=#{pre_approved_offer[:mobile_no]}&message=#{message}"
		request = RestClient.get("#{thread}")
	end
end