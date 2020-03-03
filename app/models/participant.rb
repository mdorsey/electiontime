class Participant < ApplicationRecord

  belongs_to :user
  belongs_to :party
  belongs_to :address, optional: true, dependent: :destroy
  belongs_to :district, optional: true
  belongs_to :leader_participant, class_name: "Participant", optional: true
  has_and_belongs_to_many :elections
  has_many :social_media_profiles
  has_many :survey_answers
  has_one_attached :picture
  accepts_nested_attributes_for :address, update_only: true
  accepts_nested_attributes_for :social_media_profiles
  accepts_nested_attributes_for :survey_answers
  
  validates(:user, presence: true)
  validates(:party, presence: true)
  validates(:name, length: { maximum: 255 }, presence: true)
  validates(:email, length: { maximum: 255 })
  validates(:website, length: { maximum: 255 })
  validates(:phone, length: { maximum: 255 })
  validates(:biography, length: { maximum: 5000, too_long: "%{count} characters is the maximum allowed" })

  before_destroy :allow_destroy

  def participant_name_for_display
    "#{name} (#{party.name})"
  end

  private

    # Before deletion, check if the object is in use
    def allow_destroy
      unless (social_media_profiles.empty? && survey_answers.empty?)
        throw :abort
      end
    end
end
