class Review < ActiveRecord::Base
  belongs_to :creator
  default_scope -> { order(created_at: :desc) }
  validates :body, presence: true, length: { maximum: 1000 }
  validates :creator_id, presence: true
end
