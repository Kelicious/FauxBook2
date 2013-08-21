class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :title, :photo_ids
end
