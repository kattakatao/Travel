class PostComment < ApplicationRecord
	belongs_to :end_user
	belongs_to :post
	#belongs_to :admin_user
end
