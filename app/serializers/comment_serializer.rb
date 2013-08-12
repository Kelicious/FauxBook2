class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :post_id, :author_id, :created_at
end
