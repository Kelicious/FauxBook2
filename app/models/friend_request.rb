class FriendRequest < ActiveRecord::Base
  attr_accessible :sender_id, :recipient_id

  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"

  validates :sender_id, :recipient_id, presence: :true
  validates :sender_id, uniqueness: {
    scope: [:recipient_id]
  }
  validate :sender_and_recipient_must_be_unique

  # return can be treated as a boolean
  def approve!
    friendship = Friendship.new(user_id: sender_id, friend_id: recipient_id)
    if friendship.save && friendship.reverse_friendship.save
      self.destroy
    end
  end

  private

  def sender_and_recipient_must_be_unique
    if FriendRequest.
        where(sender_id: recipient_id, recipient_id: sender_id).
        exists?
      errors.add(:recipient, "User already sent you a request")
    end
  end
end
