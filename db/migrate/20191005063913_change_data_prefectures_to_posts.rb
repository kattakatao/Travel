class ChangeDataPrefecturesToPosts < ActiveRecord::Migration[5.2]
  def change
  	change_column :posts, :prefectures, :integer, null: false, default: 0
  end
end
