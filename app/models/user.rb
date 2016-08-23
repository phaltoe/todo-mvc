class User < ActiveRecord::Base
  validates_uniqueness_of :email
  validates_presence_of :email

  has_secure_password

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(email: auth_hash["info"]["uid"]).first_or_create do |user|
      user.password = SecureRandom.hex
    end
  end


end
