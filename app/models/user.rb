class User < ApplicationRecord
  has_many :campaigns, foreign_key: 'gm_id'

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  has_secure_password

  def self.find_or_create_by_oauth(auth)
    self.find_or_create_by(uid: auth[:uid], provider: auth[:provider]) do |u|
        u.username = auth["info"]["first_name"]
        u.email = auth["info"]["email"]
        u.password = SecureRandom.hex(16)
    end
  end

end
