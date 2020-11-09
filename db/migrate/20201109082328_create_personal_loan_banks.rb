class CreatePersonalLoanBanks < ActiveRecord::Migration[5.2]
  def change
    create_table :personal_loan_banks do |t|
      t.string :name
      t.string :slug
      t.timestamps
    end
  end
end
