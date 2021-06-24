class CreateReferEarns < ActiveRecord::Migration[5.2]
  def change
    create_table :refer_earns do |t|
      t.string :full_name
      t.string :mobile_number
      t.string :product_name
      t.string :referer_full_name
      t.string :referer_mobile_number
      t.timestamps
    end
  end
end
