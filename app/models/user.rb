class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :password, length: {minimun: 6, allow_nil: true}
  validates :password_digest, presence: { message: 'Must provide password'}
  before_validation :ensure_session_token

  attr_reader :password


  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    if user && user.is_password?(password)
      return user
    else
      return nil
    end
  end

  # def self.generate_session_token

  # end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end


end
