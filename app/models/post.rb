class Post < ActiveRecord::Base
  attr_accessible :user_id, :author_id, :body, :created_at

  belongs_to :author, class_name: "User", inverse_of: :authored_posts
  belongs_to :user, inverse_of: :wall_posts

  has_many :comments, as: :commentable, dependent: :destroy

  validates :user_id, :author_id, :body, presence: true

  validate :users_are_friends

  default_scope order('posts.created_at DESC')

  private

  def users_are_friends
    unless user == author || user.is_friend_of?(author)
      errors.add(:author, "Must be friends to post")
    end
  end
end
