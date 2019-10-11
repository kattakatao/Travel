class AddReplyAdminUserIdToPostComment < ActiveRecord::Migration[5.2]
  def change
    add_column :post_comments, :reply_post_comment, :int
  end
end
