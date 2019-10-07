class ChangeDataCountryToPosts < ActiveRecord::Migration[5.2]
  def change
  	change_column :posts, :country, :integer, null: false, default: 0
  end
end
