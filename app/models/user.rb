class User < ActiveRecord::Base
  has_many :articles 
  def self.find_or_create_from_auth_hash(auth_hash)
    user = where(provider: auth_hash[:provider], uid: auth_hash[:uid]).first_or_create
    user.update(
      name: auth_hash[:info][:name],
      profile_image: auth_hash[:info][:image],
      token: auth_hash.credentials.token,
      secret: auth_hash.credentials.secret
    )
    user
  end

  def current_user
      @current_user ||=  User.find(session[:user_id]) if session[:user_id]
  end

end
