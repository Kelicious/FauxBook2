class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :description, :album_id, :created_at
  attributes :picture_url_big, :picture_url_small

  attributes :comments
end
