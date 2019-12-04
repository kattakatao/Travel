class LikesController < ApplicationController

  before_action :set_variables #変数を定義している

   def like
     like = current_end_user.likes.new(post_id: @post.id)
     like.save
   end

   def unlike
     like = current_end_user.likes.find_by(post_id: @post.id)
     like.destroy
   end

   private

   def set_variables
     @post = Post.find(params[:post_id])
     @id_name = "#like-link-#{@post.id}"
   end

 end
