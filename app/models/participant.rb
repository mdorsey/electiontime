class Participant < ApplicationRecord

  belongs_to :user
  belongs_to :address
  belongs_to :district
  belongs_to :party
  belongs_to :leader_participant_id, class_name: "Participant"
  
  validates(:user_id, presence: true)
  validates(:email, length: { maximum: 255 })
  validates(:website, length: { maximum: 255 })
  validates(:biography, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" })
  validates(:phone, length: { maximum: 255 })
  validates(:party, presence: true)
end
