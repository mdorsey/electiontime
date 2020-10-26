class SurveyQuestion < ApplicationRecord

  belongs_to :survey
  has_many :survey_answers

  validates(:survey, presence: true)
  validates(:topic, presence: true, length: { maximum: 255 })
  validates(:question, presence: true, length: { maximum: 255 })
  validates(:order, presence: true, numericality: { only_integer: true })

  before_destroy :allow_destroy

  def self.search(search_text)
    if search_text
      where('question LIKE ?', "%#{search_text}%")
    else
      unscoped
    end
  end

  private

    # Before deletion, check if the object is in use
    def allow_destroy
      unless survey_answers.empty?
        throw :abort
      end
    end
end
