class Post < ActiveRecord::Base
  attr_accessible :user_id, :author_id, :body

  belongs_to :author, class_name: "User", inverse_of: :authored_posts
  belongs_to :user, inverse_of: :posts

  validates :user_id, :author_id, :body, presence: true

  validate :users_are_friends

  private

  def users_are_friends
    user.is_friend_of?(author)
  end
end
