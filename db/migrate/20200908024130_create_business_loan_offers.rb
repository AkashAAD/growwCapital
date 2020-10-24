class CreateBusinessLoanOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :business_loan_offers do |t|
    	t.integer :business_loan_id
      t.string :business_name
      t.integer :business_nature
      t.integer :industry_type
      t.integer :business_years
      t.decimal :current_emi, precision: 20, scale: 2
      t.string :business_pan_number #optional
      t.integer :residence_type
      t.text :address_line1
      t.text :address_line2
      t.text :landmark
      t.string :city
      t.string :state
      t.string :pincode
      t.string :gst_number #optional
      t.integer :annual_turnover
      t.decimal :gross_annual_profit, precision: 20, scale: 2
      t.timestamps
    end
  end
end
