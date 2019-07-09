class Participant < ApplicationRecord

  belongs_to :user
  
  validates(:user_id, presence: true)
  validates(:email, length: { maximum: 255 })
  validates(:website, length: { maximum: 255 })
  validates(:biography, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" })
  
end
