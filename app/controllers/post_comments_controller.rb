class PostCommentsController < ApplicationController

	def create
		if current_end_user
		post = Post.find(params[:post_id])
		comment = current_end_user.post_comments.new(post_comment_params)
		comment.post_id = post.id
		comment.save
		redirect_to post_path(post)
	else
		redirect_to posts_path(post)
		end
    end

	private
		def post_comment_params
			params.require(:post_comment).permit(:end_user_id, :post_id, :comment)
	    end
	end
