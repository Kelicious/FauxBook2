class PostSerializer < ActiveModel::Serializer
  attributes :body, :user_id, :author_id, :created_at
end
