class Like < ActiveRecord::Base
  belongs_to :creator, counter_cache: :likes_count, foreign_key: "creator_id"
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :creator_id, presence: true
  validates :user_id, presence: true
  paginates_per 10
end
