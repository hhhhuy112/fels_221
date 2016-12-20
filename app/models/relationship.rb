class Relationship < ApplicationRecord
  belongs_to :follower, class_name: User.name
  belongs_to :followed, class_name: User.name

  validates :follower_id, presence: true
  validates :followed_id, presence: true

  after_create :create_activity_follow
  after_destroy :create_activity_unfollow

  private
  def create_activity_follow
    Activity.create user_id: follower_id, action: :follow, source: followed_id
  end

  def create_activity_unfollow
    Activity.create user_id: follower_id, action: :unfollow, source: followed_id
  end
end
