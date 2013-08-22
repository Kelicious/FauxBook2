class Photo < ActiveRecord::Base
  attr_accessible :description, :album_id, :picture, :created_at

  has_attached_file :picture, styles: {
    big: "600x600#",
    small: "150x150#"
  }

  belongs_to :album, inverse_of: :photos
  has_many :comments, as: :commentable, dependent: :destroy

  def picture_url_big
    picture.url(:big)
  end

  def picture_url_small
    picture.url(:small)
  end

  # hack for ember data
  def picture_url_big=(value) end
  def picture_url_small=(value) end
end
