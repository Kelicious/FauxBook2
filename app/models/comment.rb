class Comment < ActiveRecord::Base
  # make polymorphic later
  attr_accessible :post_id, :author_id, :body

  belongs_to :post, inverse_of: :comments
  belongs_to :author, class_name: "User", inverse_of: :comments

  validates :post_id, :author_id, :body, presence: true
  validate :users_are_friends

  private

  def users_are_friends
    post_recipient = post.user
    unless author.is_friend_of?(post_recipient) || author == post_recipient
      errors.add(:post, "Must be friend to comment")
    end
  end
end
