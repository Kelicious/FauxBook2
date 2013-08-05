class UserSerializer < ActiveModel::Serializer
  attributes :id, :email
  attributes :first_name, :last_name, :gender, :birth_date, :about, :political_views, :religious_views, :looking_for, :interested_in, :favorite_quotes
  attributes :profile_picture_url, :cover_picture_url
end
