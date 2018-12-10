class User < ActiveRecord::Base
  
  has_many :reviews
  validate :email_not_exist

  validates :first_name, presence: true 
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true

  
  
  has_secure_password

  def email_not_exist
    if User.find_by(email: email.downcase )
      errors.add(:user, "Email already exist")
    end
  end


end

