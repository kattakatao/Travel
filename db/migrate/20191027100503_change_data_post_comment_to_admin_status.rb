class ChangeDataPostCommentToAdminStatus < ActiveRecord::Migration[5.2]
  def change
  	change_column :post_comments, :admin_status, :boolean , default: false
  end
end
