class PostCommentsController < ApplicationController

	# def create
		# aaa = false

	 #    if current_end_user
		# 	post = Post.find(params[:post_id])
		# 	comment = current_end_user.post_comments.new(post_comment_params)
		# 	comment.post_id = post.id
		# 	if comment.save
  #              aaa = true
  #           end
		# end

		# if current_admin_user
		# 	post = Post.find(params[:post_id])
		# 	comment = current_admin_user.post_comments.new(post_comment_params)
		# 	comment.post_id = post.id
		# 	# binding.pry
		# 	if comment.save
  #              aaa = true
  #          end
  #       end

		# if aaa
		# 	redirect_to post_path(post)
		# else
		# 	#redirect_to posts_path(post)
		# end
  #   end

    def create
	  if current_end_user
		post = Post.find(params[:post_id])
		comment = current_end_user.post_comments.new(post_comment_params)
		comment.post = post
		comment.save!
		redirect_to post_path(post)
	 elsif current_admin_user
	 	post = Post.find(params[:post_id])
		comment = current_admin_user.post_comments.new(post_comment_params)
		comment.post = post
	 	comment.admin_status = true
	 	comment.save!
	 	redirect_to post_path(post)
	 else
		redirect_to posts_path
	  end
    end

    def destroy
    	 if current_end_user
		post = Post.find(params[:post_id])
		comment = current_end_user.post_comments.find_by_id(params[:id])
		comment.destroy
		redirect_to post_path(post)
	 elsif current_admin_user
	 	post = Post.find(params[:post_id])
		comment = current_admin_user.post_comments.find_by_id(params[:id])
	 	comment.destroy
	 	redirect_to post_path(post)
	 else
		redirect_to posts_path
	   end
    end


	private
		def post_comment_params
			params.require(:post_comment).permit(:end_user_id, :post_id, :comment, :admin_user_id, :admin_status)
	    end
	end

	 # :admin_user_id, :reply_post_comment

	# def create
	# 	if current_end_user
	# 	post = Post.find(params[:post_id])
	# 	comment = current_end_user.post_comments.new(post_comment_params)
	# 	comment.post_id = post.id
	# 	comment.save
	# 	redirect_to post_path(post)

	# elsif current_admin_user
	# 	post = Post.find(params[:post_id])
	# 	comment = current_admin_user.post_comments.new(post_comment_params)
	# 	comment.post_id = post.id
	# 	comment.save
	# 	redirect_to post_path(post)
	# else
	# 	redirect_to posts_path(post)
	# 	end
	# end

 #    end

	# private
	# 	def post_comment_params
	# 		params.require(:post_comment).permit(:end_user_id, :post_id, :comment, :admin_user_id)
	#     end
	# end

	# #def new
	#  @post_comment = PostComment.new
	# end
	# def new
	# 	if current_admin_user
	# 		post = Post.find(params[:post_id])
	# 		comment = current_admin_user.post_comments.new(post_comment_params)
	# 		comment.post_id = post.id
	# 		comment.save
	# 		redirect_to post_path(post)
	# 	else
	# 	  	redirect_to posts_path(post)
	# 	end
 #    end

 # 	def create
	# 	 if
	# 	   post = Post.find(params[:post_id])
	# 	   comment = current_end_user.post_comments.new(post_comment_params)
	# 	   comment.post_id = post.id
	# 	   comment.save
	# 	   redirect_to post_path(post)
	# 	# elsif admin_user_signed_in?
	# 	#   post = Post.find(params[:post_id])
	# 	#   comment = current_admin_user.post_comments.new(post_comment_params)
	# 	#   comment.post_id = post.id
	# 	#   comment.save!
	# 	#   redirect_to post_path(post)
	# 	else
	# 	  redirect_to posts_path(post)
	# 	 end
	# 	end


	# private
	# 	def post_comment_params
	# 		params.require(:post_comment).permit(:end_user_id, :post_id, :comment)#, :admin_user_id, :reply_post_comment)#.merge(end_user_id: current_end_user.id, post_id: params[:post_id])
	#     end
	# end
