class RemoveFavoritesCountFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :favorites_count, :integer
  end
end
