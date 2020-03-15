class SurveyAnswer < ApplicationRecord
  
  belongs_to :survey_question
  belongs_to :participant

  validates(:survey_question, presence: true)
  validates(:participant, presence: true)
  validates(:answer, presence: true, length: { maximum: 5000, too_long: "%{count} characters is the maximum allowed" })

  def self.search(search_text)
    if search_text
      where('answer LIKE ?', "%#{search_text}%")
    else
      unscoped
    end
  end
end
