class BusinessLoanController < ApplicationController
	def new_business_loan 
		@business_loan = BusinessLoan.new
	end

	def create_business_loan
		debugger
	end
end
