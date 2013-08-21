class Album < ActiveRecord::Base
  attr_accessible :title, :user_id

  has_many :photos, inverse_of: :album
  belongs_to :user, inverse_of: :albums

  validates :title, presence: true
end
