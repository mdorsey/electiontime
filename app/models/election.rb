class Election < ApplicationRecord
  
  belongs_to :election_type
  belongs_to :jurisdiction
  has_and_belongs_to_many :districts
  has_and_belongs_to_many :participants
  has_many :surveys
  has_one_attached :picture

  validates(:name, presence: true, length: { maximum: 255 })
  validates(:election_date, presence: true)
  validates(:election_type, presence: true)
  validates(:jurisdiction, presence: true)

  before_destroy :allow_destroy

  def self.search(search_text)
    if search_text
      where('name LIKE ?', "%#{search_text}%")
    else
      unscoped
    end
  end

  def parties_for_display
    self.participants.where(is_candidate: false).order(name: :asc)
  end

  def candidates_for_display(district_id)
    self.participants.where(district_id: district_id).order(name: :asc)
  end

  def party_leaders_for_display
    party_leaders = Array.new
    
    parties = self.parties_for_display
    parties.each do |party|
      if party.leader_participant_id
        party_leaders << Participant.find(party.leader_participant_id)
      end
    end

    # Order the leaders alphabetically
    party_leaders.sort! { |a,b| a.name.downcase <=> b.name.downcase }

    return party_leaders
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
      unless surveys.empty?
        throw :abort
      end
    end
end
