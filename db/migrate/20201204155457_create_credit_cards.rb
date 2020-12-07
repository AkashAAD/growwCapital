class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.string :mobile_number
      t.integer :otp
      t.boolean :otp_verified, default: false
      t.string :reference_number
      t.boolean :terms_and_conditions
      t.string :status
      t.integer :employment_type
      t.string :email
      t.datetime :dob
      t.string :full_name
      t.boolean :existing_card, default: false
      t.integer :card_id
      t.text :address
      t.string :city
      t.string :pincode
      t.text :office_address
      t.string :office_city
      t.string :office_pincode
      t.integer :bank_name
      # t.decimal :annual_fee, precision: 20, scale: 2
      t.timestamps
    end
    add_index :credit_cards, :card_id
  end
end
