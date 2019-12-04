class Favorite < ApplicationRecord
	belongs_to :end_user
	belongs_to :post, counter_cache: :favorites_count
end
