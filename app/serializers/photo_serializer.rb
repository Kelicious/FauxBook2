class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :picture_url_big, :picture_url_small, :album_id
end
