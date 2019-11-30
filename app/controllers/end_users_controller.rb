class EndUsersController < ApplicationController

	before_action :authenticate_end_user!

  def show
	@end_user = EndUser.find(params[:id])
	a = @end_user.post_comments
	@a = []
	a.each do |b|
		@a.push(b.post_id)
	end
	@a.uniq!

	c = @end_user.likes
	
	@c = []
	c.each do |d|
		@c.push(d.post_id)
  end
end
end
