class Comment < ActiveRecord::Base
  # make polymorphic later
  attr_accessible :author_id, :body

  belongs_to :commentable, polymorphic: true
  belongs_to :author, class_name: "User", inverse_of: :comments

  validates :author_id, :body, presence: true
  validate :users_are_friends

  private

  def users_are_friends
    recipient = commentable.user
    unless author.is_friend_of?(recipient) || author == recipient
      errors.add(:commentable, "Must be friend to comment")
    end
  end
end
