class SocialMediaType < ApplicationRecord

  has_many :social_media_profiles

  validates(:name, presence: true, length: { maximum: 255 })
  validates(:website, presence: true, length: { maximum: 255 })
  validates(:icon, length: { maximum: 255 })

  before_destroy :allow_destroy

  def self.search(search_text)
    if search_text
      where('name LIKE ?', "%#{search_text}%")
    else
      unscoped
    end
  end

  private

    # Before deletion, check if the object is in use
    def allow_destroy
      unless social_media_profiles.empty?
        throw :abort
      end
    end
end
