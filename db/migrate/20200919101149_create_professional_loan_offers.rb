class CreateProfessionalLoanOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :professional_loan_offers do |t|
	    t.integer :professional_loan_id
      t.string :name
      t.timestamps
    end
  end
end
