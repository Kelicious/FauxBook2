class Profile < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :gender, :birth_date
  attr_accessible :about, :political_views, :religious_views
  attr_accessible :looking_for, :interested_in, :favorite_quotes
  attr_accessible :user_id
  
  belongs_to :user, inverse_of: :profile

  validates :first_name, :last_name, :birth_date, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end
