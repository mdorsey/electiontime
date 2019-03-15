class User < ApplicationRecord
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  belongs_to :user_type
  has_secure_password

  # Lowercase the email before saving
  before_save { self.email = email.downcase }

  # Validations
  validates(:first_name, presence: true, length: { maximum: 255 })
  validates(:last_name, presence: true, length: { maximum: 255 })
  validates(:email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false })
  validates(:password, presence: true, length: { minimum: 6 })
end
