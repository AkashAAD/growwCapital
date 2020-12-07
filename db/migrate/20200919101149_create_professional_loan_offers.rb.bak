class CreateProfessionalLoanOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :professional_loan_offers do |t|
	    t.integer :professional_loan_id
      t.integer :profession_type
      t.integer :degree
      t.integer :current_profession_since_year
      t.decimal :annual_income, precision: 20, scale: 2
      t.decimal :current_emi, precision: 20, scale: 2
      t.timestamps
    end
    add_index :professional_loan_offers, :professional_loan_id
  end
end
