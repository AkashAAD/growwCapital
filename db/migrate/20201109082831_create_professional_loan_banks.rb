class CreateProfessionalLoanBanks < ActiveRecord::Migration[5.2]
  def change
    create_table :professional_loan_banks do |t|
      t.string :name
      t.string :slug
      t.timestamps
    end
  end
end
