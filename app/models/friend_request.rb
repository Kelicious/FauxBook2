class FriendRequest < ActiveRecord::Base
  attr_accessible :sender_id, :recipient_id

  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"

  validates :sender_id, :recipient_id, presence: :true
  validates :sender_id, uniqueness: {
    scope: [:recipient_id]
  }

  # return can be treated as a boolean
  def approve!
    friendship = Friendship.new(user_id: sender_id, friend_id: recipient_id)
    if friendship.save && friendship.reverse_friendship.save
      self.destroy
    end
  end
end
