class User < ActiveRecord::Base
  
  has_many :attendees
  has_many :events, :through => :attendees
  
  has_many :events
  def self.from_omniauth(auth)
    user = User.find_by(uid: auth[:uid]) || User.new
    user.attributes = {
      provider: auth[:provider],
      uid: auth[:uid],
      name: auth[:info][:name],
      oauth_token: auth[:credentials][:token],
      oauth_expires_at: auth[:credentials][:expires_at]
    }
    user.save!
    return user
  end
end

