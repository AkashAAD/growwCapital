class CreatePreApprovedOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :pre_approved_offers do |t|
      t.string :first_name
      t.string :last_name
      t.string :mobile_no
      t.string :reference_number
      t.boolean :opt_status
      t.timestamps
    end
  end
end
