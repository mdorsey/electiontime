class SurveyQuestion < ApplicationRecord

  belongs_to :survey
  has_many :survey_answers

  validates(:survey, presence: true)
  validates(:question, presence: true, length: { maximum: 255 })
  validates(:order, presence: true, numericality: { only_integer: true })

  before_destroy :allow_destroy

  private

    # Before deletion, check if the object is in use
    def allow_destroy
      unless survey_answers.empty?
        throw :abort
      end
    end
end