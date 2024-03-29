class Election < ApplicationRecord
  
  belongs_to :election_type
  belongs_to :jurisdiction
  has_many :contents
  has_many :offices
  has_many :surveys
  has_and_belongs_to_many :participants
  has_one_attached :picture
  has_one_attached :feature_image

  validates(:name, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false })
  validates(:election_date, presence: true)
  validates(:election_type, presence: true)
  validates(:jurisdiction, presence: true)
  validate :picture_is_correct_format
  validate :feature_image_is_correct_format

  before_destroy :allow_destroy
  after_create :update_slug
  before_update :assign_slug

  def self.search(search_text)
    if search_text
      where('name LIKE ?', "%#{search_text}%")
    else
      unscoped
    end
  end

  def parties_for_display
    self.participants.where(is_candidate: false).shuffle
  end

  def candidates_for_display(office_id, district_id = nil)
    if district_id
      self.participants.where(office_id: office_id, district_id: district_id).shuffle
    else
      self.participants.where(office_id: office_id).shuffle
    end
  end

  def party_leaders_for_display
    self.participants.where(is_party_leader: true).shuffle
  end

  def survey_questions_by_type(survey_type_name)
    survey_questions = Hash.new
    survey_type = SurveyType.find_by(name: survey_type_name)
    survey = self.surveys.find_by(survey_type_id: survey_type.id)

    if survey
      SurveyQuestion.where(survey_id: survey.id).order(order: :asc).each do |q|
        survey_questions[q.id] = q.topic
      end
    end

    return survey_questions
  end

  private

    # Before deletion, check if the object is in use
    def allow_destroy
      unless (surveys.empty? && contents.empty?)
        throw :abort
      end
    end

    def create_slug
      name.to_s.parameterize
    end

    def update_slug
      update_attributes slug: assign_slug
    end

    def assign_slug
      self.slug = create_slug
    end

    def picture_is_correct_format
      if picture.attached?
        unless picture.content_type =~ /^image\/(jpeg|jpg|png)$/
          errors.add(:picture, "is not a valid image file type")
        end
      end
    end

    def feature_image_is_correct_format
      if feature_image.attached?
        unless feature_image.content_type =~ /^image\/(jpeg|jpg|png)$/
          errors.add(:feature_image, "is not a valid image file type")
        end
      end
    end
end
