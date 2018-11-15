class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :password, length: {minimun: 6, allow_nil: true}
  validates :password_digest, presence: { message: 'Must provide password'}
  before_validation :ensure_session_token

  # def self.find_by_credentials(email, password)
  #   user = User.find_by(email: email)
  #     if user
  #
  # end

  def self.generate_session_token

  end

  def reset_session_token!

  end

  def ensure_session_token
    
  end

  def password=(password)

  end

  def is_password?(password)
    Bcrypt
  end


end
