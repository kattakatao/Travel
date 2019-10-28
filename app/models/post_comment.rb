class PostComment < ApplicationRecord
	belongs_to :end_user, optional: true
	belongs_to :post
	belongs_to :admin_user, optional: true
end
