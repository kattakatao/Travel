class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :admin_user_id
      t.string :title
      t.string :category
      t.string :country
      t.string :prefectures
      t.string :city
      t.string :place
      t.date :date
      t.text :image_id
      t.text :content

      t.timestamps
    end
  end
end
