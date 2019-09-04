class SocialMediaType < ApplicationRecord

  has_many :social_media_profiles

  validates(:name, presence: true, length: { maximum: 255 })

  before_destroy :allow_destroy

  private

    # Before deletion, check if the object is in use
    def allow_destroy
      unless social_media_profiles.empty?
        throw :abort
      end
    end
end
