class User < ActiveRecord::Base
  attr_accessible :email, :password, :screen_name, :session_token
  attr_reader :password

  before_validation { |user| user.reset_session_token!(false) }

  validates(
      :password_digest,
      :session_token,
      :email,
      :presence => true
    )

  validates :email, :uniqueness => true

  has_many(
    :notes,
    class_name: 'Note',
    foreign_key: :user_id,
    primary_key: :id
  )

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)

    user.is_password?(password) ? user : nil
  end

  def is_password?(password)
     BCrypt::Password.new(self.password_digest).is_password?(password)
   end

   def password=(password)
     @password = password
     self.password_digest = BCrypt::Password.create(password).to_s
   end

   def reset_session_token!(force = true)
     return unless self.session_token.nil? || force

     self.session_token = SecureRandom.urlsafe_base64(16)
     self.save!
   end

end
