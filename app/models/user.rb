class User < ActiveRecord::Base
  attr_accessible :email, :password_digest, :screen_name, :session_token

  validates(
      :password_digest,
      :session_token,
      :email,
      :presence => true
    )

  validates :email, :screen_name, :uniqueness => true

end
