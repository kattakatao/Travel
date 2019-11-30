class Like < ApplicationRecord

  belongs_to :post, counter_cache: :favorites_count
  belongs_to :end_user
end
