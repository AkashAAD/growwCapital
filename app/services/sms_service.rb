class SmsService
  def initialize
  	@api_key = Rails.application.config.TEXT_LOCAL_KEY
  	@api_url = Rails.application.config.TEXT_LOCAL_URL
  end

	def send_otp(loan, loan_type)
		# message = "Dear Customer, Your #{loan_type} otp is #{loan.otp}. Do not share this with anyone. No Growwcapital employee will call and ask for your OTP. Call +91-88066-01122 if not requested by you."
		# thread = "#{Rails.application.config.SMS_URL}&numbers=#{loan.mobile_number}&message=#{message}"
		# request = RestClient.get("#{thread}")
		# debugger
		# uri = URI.parse(@api_url)
		# http = Net::HTTP.start(uri.host, uri.port)
		# request = Net::HTTP::Get.new(uri.request_uri)
		 
		# res = Net::HTTP.post_form(uri, 'apikey' => @api_key, 'message' => 'Hello Akash', 'sender' => '600010', 'numbers' => '7387145433')
		# response = JSON.parse(res.body)
		# puts "#{response}"
	end

	def send_preapproved_otp(pre_approved_offer, otp)
		message = "Dear #{pre_approved_offer[:first_name]} #{pre_approved_offer[:last_name]}, Your preappoved offer otp is #{otp}. Do not share this with anyone. No Growwcapital employee will call and ask for your OTP. Call +91-88066-01122 if not requested by you."
		thread = "#{Rails.application.config.SMS_URL}&numbers=#{pre_approved_offer[:mobile_no]}&message=#{message}"
		request = RestClient.get("#{thread}")
	end

	def instant_application(application, product, loan_purpose)
		message = "Dear Admin, #{application.full_name} tried to reach us!.
		 Here is other details Mobile Number: #{application.mobile_number}, 
		 Email: #{application.email}, 
		 Product Name: #{product},
		 Loan/ Card Purpose: #{loan_purpose}"

		thread = "#{Rails.application.config.SMS_URL}&numbers=8806601122&message=#{message}"
		request = RestClient.get("#{thread}")
	end

end