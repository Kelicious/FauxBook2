class PostSerializer < ActiveModel::Serializer
  attributes :id, :body, :user_id, :author_id, :created_at
end
