class Creator < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  mount_uploader :image, ImageUploader
  validates :user_id, presence: true
  validates :name, presence: true, uniqueness: true
  validate  :image_size
  paginates_per 4
  acts_as_taggable_on :tag # post.label_list が追加される
  acts_as_taggable            # acts_as_taggable_on :tags のエイリアス

  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end

  def escape_like(string)
    string.gsub(/[\\%_]/){|m| "\\#{m}"}
  end

  def image_size
    if image.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
