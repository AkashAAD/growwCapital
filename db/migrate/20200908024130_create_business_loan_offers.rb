class CreateBusinessLoanOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :business_loan_offers do |t|
    	t.integer :business_loan_id
      t.integer :company_type
      t.integer :business_nature
      t.integer :industry_type
      t.integer :business_years
      t.decimal :current_emi, precision: 20, scale: 2
      t.string :full_name
      t.string :gender
      t.string :pincode
      t.string :pancard
      t.datetime :dob
      t.string :email
      t.string :is_rbi_offer
      t.integer :residence_type
      t.string :city
      t.string :gst_number
      t.timestamps
    end
  end
end
