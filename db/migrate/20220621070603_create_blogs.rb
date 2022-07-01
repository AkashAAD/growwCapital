class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.text :title
      t.text :content
      t.text :keywords
      t.text :meta_description
      t.string :auther_name
      t.string :publish_date
      t.boolean :approved, default: false
      t.timestamps
    end
  end
end
