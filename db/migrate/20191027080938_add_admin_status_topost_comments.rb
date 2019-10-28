class AddAdminStatusTopostComments < ActiveRecord::Migration[5.2]
  	def change
    add_column :post_comments, :admin_status, :integer, default: false
  end
end
