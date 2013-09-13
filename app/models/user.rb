class User < ActiveRecord::Base
  attr_accessible :email, :password_digest, :screen_name, :session_token

  validates(
      :password_digest,
      :session_token,
      :email,
      :presence => true
    )

  validates :email, :screen_name, :uniqueness => true

  has_many(
    :notes,
    class_name: 'Note',
    foreign_key: :user_id,
    primary_key: :id
  )

end
