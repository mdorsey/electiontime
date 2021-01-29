class SurveyAnswer < ApplicationRecord
  
  belongs_to :survey_question
  belongs_to :participant

  validates(:survey_question, presence: true)
  validates(:participant, presence: true)
  validates(:answer, presence: true)
  validate :survey_answer_max_character_length

  def self.search(search_text)
    if search_text
      where('answer LIKE ?', "%#{search_text}%")
    else
      unscoped
    end
  end

  private

    def survey_answer_max_character_length
      system_setting = SystemSetting.find_by(name: "survey_answer_max_character_length")

      if system_setting
        max_length = system_setting.setting.to_i
      else
        # Default setting
        max_length = 1000
      end

      if answer.present? && answer.length > max_length
        errors.add(:answer, "must be less than or equal to " + max_length.to_s + " characters")
      end
    end
end
