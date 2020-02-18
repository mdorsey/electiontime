class SocialMediaProfile < ApplicationRecord
  
  belongs_to :participant
  belongs_to :social_media_type

  validates(:handle, length: { maximum: 255 })
  validates(:participant, presence: true)
  validates(:social_media_type, presence: true)
end
