class SmsService
  def initialize
  	@api_key = Rails.application.config.TEXT_LOCAL_KEY
  	@api_url = Rails.application.config.TEXT_LOCAL_URL
  end

	def send_otp(loan, loan_type)
		message = "Dear Customer, Your #{loan_type} otp is #{loan.otp}. Do not share this with anyone. No Growwcapital employee will call and ask for your OTP. Call +91-88066-01122 if not requested by you."
		send_message(message, loan.mobile_number)
	end

	def send_preapproved_otp(pre_approved_offer, otp)
		message = "Dear #{pre_approved_offer[:first_name]} #{pre_approved_offer[:last_name]}, Your preappoved offer otp is #{otp}. Do not share this with anyone. No Growwcapital employee will call and ask for your OTP. Call +91-88066-01122 if not requested by you."
		send_message(message, pre_approved_offer[:mobile_no])
	end

	def instant_application(application, product, loan_purpose)
		message = "Dear Customer, We received your #{product.downcase} application. Our support executive will reach you soon."
		# send_message(message, pre_approved_offer[:mobile_no])
	end

	private
	def send_message(message, mob_number)
		uri = URI.parse(@api_url)
		http = Net::HTTP.start(uri.host, uri.port)
		request = Net::HTTP::Get.new(uri.request_uri)

		res = Net::HTTP.post_form(uri, 'apikey' => @api_key, 'message' => message, 'sender' => 'GRWCAP', 'numbers' => mob_number)
		response = JSON.parse(res.body)
		puts "#{response}"
	end
end
