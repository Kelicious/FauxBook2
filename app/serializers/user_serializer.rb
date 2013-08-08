class UserSerializer < ActiveModel::Serializer
  attributes :id, :email

  # profile info
  attributes :first_name, :last_name, :gender, :birth_date, :about, :political_views, :religious_views, :looking_for, :interested_in, :favorite_quotes
  attributes :profile_picture_url_big, :cover_picture_url
  attributes :profile_picture_url_small

  # friend info
  attributes :friend_request_recipient_ids
  attributes :friend_request_sender_ids
  attributes :friend_ids
end
