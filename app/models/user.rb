class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation

  # Not Devise related
  attr_accessible :first_name, :last_name, :gender, :birth_date, :about, :political_views, :religious_views, :looking_for, :interested_in, :favorite_quotes

  validates :email, uniqueness: true

  validates :first_name, :last_name, :birth_date, :gender, presence: true

  # pictures
  attr_accessible :profile_picture
  has_attached_file :profile_picture, :styles => {
    :big => "200x200>",
    :small => "50x50>"
  }

  attr_accessible :cover_picture
  has_attached_file :cover_picture, :styles => {
    :big => "1000x250#",
  }

  def profile_picture_url_big
    profile_picture.url(:big)
  end

  def profile_picture_url_small
    profile_picture.url(:small)
  end

  def cover_picture_url
    cover_picture.url(:big)
  end

  # hack needed to prevent mass assignment error when ember data syncs
  attr_accessible :profile_picture_url_big, :cover_picture_url
  attr_accessible :profile_picture_url_small
  def profile_picture_url_big=(value) end
  def profile_picture_url_small=(value) end
  def cover_picture_url=(value) end

  # friend-related stuff
  has_many :incoming_friend_requests, foreign_key: "recipient_id", class_name: "FriendRequest"
  has_many :outgoing_friend_requests, foreign_key: "sender_id", class_name: "FriendRequest"
  has_many :friend_request_recipients, through: :outgoing_friend_requests, source: :recipient
  has_many :friend_request_senders, through: :incoming_friend_requests, source: :sender

  has_many :friendships
  has_many :friends, through: :friendships

  def is_friend_of?(other_user)
    friend_ids.include?(other_user.id)
  end

  # post-related stuff
  has_many :authored_posts, class_name: "Post", foreign_key: "author_id", inverse_of: :author
  has_many :wall_posts, class_name: "Post", inverse_of: :user
  has_many :comments, foreign_key: "author_id", inverse_of: :author
end
