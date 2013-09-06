class Comment < ActiveRecord::Base
  # make polymorphic later
  attr_accessible :author_id, :body

  belongs_to :commentable, polymorphic: true
  belongs_to :author, class_name: "User", inverse_of: :comments

  validates :author_id, :body, :commentable, presence: true
  validate :users_are_friends

  private

  def users_are_friends
    # need the condition check so the rspec test doesn't throw an error
    if author && commentable
      recipient = commentable.user
      unless author.friend_of?(recipient) || author == recipient
        errors.add(:commentable, "Must be friend to comment")
      end
    end
  end
end
