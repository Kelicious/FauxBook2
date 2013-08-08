class Friendship < ActiveRecord::Base
  attr_accessible :user_id, :friend_id

  belongs_to :user
  belongs_to :friend, class_name: "User"

  validates :user_id, :friend_id, presence: :true
  validates :user_id, uniqueness: {
    scope: [:friend_id]
  }

  def destroy!
    persisted_reverse_friendship.try(:destroy)
    destroy
  end

  # only used in FriendRequest#approve!
  def reverse_friendship
    Friendship.new(user_id: friend_id, friend_id: user_id)
  end

  private

  def persisted_reverse_friendship
    Friendship.find_by_user_id_and_friend_id(friend_id, user_id)
  end
end
