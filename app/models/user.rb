class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  has_many :reviews
  validates :first_name, presence: true
  validates :last_name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false}
  has_secure_password
  validates :password, length: {minimum: 4}

  def self.authenticate_with_credentials (email, password)
    current_user_email = email.downcase.strip
    current_user = User.find_by(email: current_user_email)
    if current_user && current_user.authenticate(password)
      current_user
    else
      nil
    end 
  end
end
