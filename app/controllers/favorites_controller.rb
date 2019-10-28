class FavoritesController < ApplicationController

	def create
	 if current_end_user
		post = Post.find(params[:post_id])
		favorite = current_end_user.favorites.new(post_id: post.id)
		favorite.save
		redirect_to post_path(post)
	 else
	 	redirect_to new_end_user_registration_path
	 end
	end

	def destroy
		post = Post.find(params[:post_id])
		favorite = current_end_user.favorites.find_by(post_id: post.id)
		favorite.destroy
		redirect_to post_path(post)
	end
end
