class Participant < ApplicationRecord

  belongs_to :user
  belongs_to :party
  belongs_to :address, optional: true
  belongs_to :district, optional: true
  belongs_to :leader_participant, class_name: "Participant", optional: true
  has_and_belongs_to_many :elections
  
  validates(:user, presence: true)
  validates(:party, presence: true)
  validates(:email, length: { maximum: 255 })
  validates(:website, length: { maximum: 255 })
  validates(:biography, length: { maximum: 5000, too_long: "%{count} characters is the maximum allowed" })
  validates(:phone, length: { maximum: 255 })

  def participant_name_for_display
    "#{user.last_name}, #{user.first_name} (#{party.name})"
  end
end
