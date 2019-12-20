class EndUsersController < ApplicationController

	before_action :authenticate_end_user!

  def show
			@end_user = EndUser.find(params[:id])
			end_user_comment = @end_user.post_comments
			@end_user_comment = []
		end_user_comment.each do |end_user_comment|
			@end_user_comment.push(end_user_comment.post_id)
		end
			@end_user_comment.uniq!

			end_user_like = @end_user.likes

			@end_user_like = []
		end_user_like.each do |end_user_like|
			@end_user_like.push(end_user_like.post_id)
  end
end
end
