class CreateLoanAgainstPropertyBanks < ActiveRecord::Migration[5.2]
  def change
    create_table :loan_against_property_banks do |t|
      t.string :name
      t.string :slug
      t.timestamps
    end
  end
end
