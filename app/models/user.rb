class User < ActiveRecord::Base
  
  has_many :reviews
  validate :email_already_exist

  validates :first_name, presence: true 
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, length: { minimum: 6 }
  validates :password_digest, presence: true

  
  
  has_secure_password

  def email_already_exist
    if User.find_by(email: email.downcase )
      errors.add(:user, "Email already exist")
    end
  end
  
  def self.authenticate_with_credentials(email, password)

    User.find_by(email:email).try(:authenticate, password) || nil
  end

end

