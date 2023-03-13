class User < ApplicationRecord
  validates :username, :session_token, presence: true
  validates :password_digest, presences: { message: 'Password can\'t be blank'}
  validates :password, length: { minimum: 6, allow_nil: true}

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest.is_password?(password))
  end

  def self.find_by_credentials(username, password)

  end


  private
  def user_params
    params.require(:user).permit(:username, :password_digest)
  end
end
