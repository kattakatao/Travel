class ChangeDatatypeReplyPostCommentOfPostComments < ActiveRecord::Migration[5.2]
  def change
  	change_column :post_comments, :reply_post_comment, :text
  end
 end
