class SocialMediaProfile < ApplicationRecord
  
  belongs_to :participant
  belongs_to :social_media_type

  validates(:handle, presence: true, length: { maximum: 255 })
  validates(:participant, presence: true)
  validates(:social_media_type, presence: true)
end
