class NewCarLoanController < ApplicationController
	before_action :create_new_car_loan, only: [:create_otp]
	before_action :update_new_car_loan, only: [:update]
  before_action :create_new_car_loan_offer, only: [:create_new_car_offer]
  before_action :update_new_car_loan_offer, only: [:update_new_car_offer]
  before_action :update_new_car_loan_assets, only: [:update_new_car_assets]

	include Wicked::Wizard
	steps :step1, :step2, :step3, :step4, :step5, :step6

	def show
		# session[:new_car_loan_id] = nil
    id = session[:new_car_loan_id]
    case params[:id]
    when "step1"
      @new_car_loan = id.nil? ? NewCarLoan.new : get_new_car_loan(id)
      return redirect_to new_car_loan_path("step2") if !@new_car_loan.otp_verified && !@new_car_loan.otp.blank?
      return redirect_to new_car_loan_path("step3") if @new_car_loan.otp_verified
    when "step2"
      @new_car_loan = id.nil? ? NewCarLoan.new : get_new_car_loan(id)
      return redirect_to new_car_loan_path("step3") if @new_car_loan.otp_verified
    when "step3", "step4", "step5"
      @new_car_loan = id.nil? ? NewCarLoan.new : get_new_car_loan(id)
      return redirect_to new_car_loan_path("step2") unless @new_car_loan.otp_verified
      @new_car_loan_offer =  @new_car_loan.new_car_loan_offer.try(:id) ? @new_car_loan.new_car_loan_offer : NewCarLoanOffer.new
    when "step6"
      @new_car_loan = get_new_car_loan(id) #NewCarLoan.last
      session[:new_car_loan_id] = nil
    end
    render_wizard
	end

  def create_otp
    @new_car_loan.reference_number = "NCL#{(rand*100000000).to_i}"
    create_update_new_car_loan(@new_car_loan.save, "New Car Loan created successfully.", new_car_loan_path("step2"))
  end

  def update_otp_status
    @new_car_loan = get_new_car_loan(session[:new_car_loan_id])
    if @new_car_loan.otp.eql?(params[:new_car_loan][:otp])
      @new_car_loan.otp_verified = true
      @new_car_loan.save
      flash[:error] = "The entered OTP verified successfully."
      redirect_to new_car_loan_path("step3")
    else
      flash[:error] = "The entered OTP is not valid."
      redirect_to new_car_loan_path("step2")
    end
  end

	def update
    create_update_new_car_loan(@update_status_ncl, "New Car Loan updated successfully.", new_car_loan_path("step4"))
	end

	def create_new_car_offer
		create_update_new_car_loan_offer(@new_car_loan_offer.save, "New Car Loan offer applied successfully.", new_car_loan_path("step5"))
	end

	def update_new_car_offer
		create_update_new_car_loan_offer(@update_status_nclo, "New Car Loan offer applied successfully.", new_car_loan_path("step5"))
	end

	def update_new_car_assets
		session[:new_car_loan_id] = nil if @update_status_ncl
		create_update_new_car_loan(@update_status_ncl, "New Car Loan updated successfully.", new_car_loan_path("step6"))
	end

	private
	def new_car_loan_params
    params.require(:new_car_loan).permit(:first_name,
      :middle_name,
      :last_name,
      :dob,
      :gender,
      :marital_status,
      :highest_qualification,
      :no_of_dependent,
      :current_residency_since_year,
      :current_city_since_year,
      :pan_number,
      :purpose_of_loan,
      :address_line1,
      :address_line2,
      :landmark,
      :city,
      :state,
      :pincode,
      :residential_type,
      :mobile_number,
      :email,
      :loan_amount,
      :tenure,
      :terms_and_conditions)
	end

  def new_car_loan_offer_params
  	params.require(:new_car_loan_offer).permit(:name)
  end

	def new_car_loan_assets_params
    params.require(:new_car_loan).permit(:persoanl_bank_statement,
    	:business_bank_statement,
    	:id_proof,
    	:salary_slip,
    	:itr_copy,
    	:passport_photo)		
	end

	def get_new_car_loan(id)
		@new_car_loan = NewCarLoan.find(id)
	end

	def create_new_car_loan
		@new_car_loan = NewCarLoan.new(new_car_loan_params)
	end

	def update_new_car_loan
		@update_status_ncl = get_new_car_loan(session[:new_car_loan_id]).update_attributes(new_car_loan_params)
	end

	def create_new_car_loan_offer
		get_new_car_loan(session[:new_car_loan_id])
		@new_car_loan_offer = NewCarLoanOffer.new(new_car_loan_offer_params)
		@new_car_loan_offer.new_car_loan_id = @new_car_loan.id
	end

	def update_new_car_loan_offer
		get_new_car_loan(session[:new_car_loan_id])
		@update_status_nclo = @new_car_loan.new_car_loan_offer.update_attributes(new_car_loan_offer_params)
	end


	def update_new_car_loan_assets
		get_new_car_loan(session[:new_car_loan_id])
		@update_status_ncl = @new_car_loan.update_attributes(new_car_loan_assets_params)
	end

	def create_update_new_car_loan(status, message, path)
		if status
			session[:new_car_loan_id] = @new_car_loan.id
      unless @new_car_loan.otp_verified
        sms = SmsService.new
        @new_car_loan.otp = 1234
        @new_car_loan.save
        sms.send_otp(@new_car_loan)
      end
			flash[:notice] = message
			redirect_to path
		else
			render "new_car_loan/step1"
		end
	end
	
  def create_update_new_car_loan_offer(status, message, path)
		if status
			flash[:notice] = message
			redirect_to path
		else
			render "new_car_loan/step2"
		end
  end

end
