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

  def profile_picture_url
    profile_picture.url(:big)
  end

  def cover_picture_url
    cover_picture.url(:big)
  end
end
