class CreateUsedCarLoanOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :used_car_loan_offers do |t|
      t.integer :used_car_loan_id
      t.string :registration_state
      t.string :registration_city
      t.string :car_manufacturer
      t.string :car_model

      t.string :car_registration_number
      t.string :model_year

      t.string :profession_status #salaried or self-employed
	t.decimal :current_emi, precision: 20, scale: 2
      
      # if Salaried selected
      t.string :employer_name
      t.string :designation
      t.string :years_in_current_job
      t.text :office_address_line1
      t.text :office_address_line2
      t.text :landmark
      t.string :office_state
      t.string :office_city
      t.string :office_email
      t.string :office_pincode
      t.integer :mailing_address
      t.string :first_name
      t.string :last_name
      t.string :mobile_number
      t.string :ref_mobile_number
      t.integer :salary_bank_account_name
      t.string :branch_name
      t.decimal :monthly_net_salary, precision: 20, scale: 2
      
      
      # If self employment selected
      t.string :business_name
      t.integer :business_nature
      t.integer :industry_type
      t.integer :business_years
      t.string :business_pan_number #optional
      t.integer :residence_type
      t.text :address_line1
      t.text :address_line2
      t.text :bus_landmark
      t.string :city
      t.string :state
      t.string :pincode
      t.string :gst_number #optional
      t.integer :annual_turnover
      t.decimal :gross_annual_profit, precision: 20, scale: 2   
      t.timestamps
    end
    add_index :used_car_loan_offers, :used_car_loan_id
  end
end
