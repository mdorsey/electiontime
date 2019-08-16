class SurveyQuestion < ApplicationRecord
  belongs_to :survey

  validates(:survey, presence: true)
  validates(:question, presence: true, length: { maximum: 255 })
  validates(:order, presence: true, numericality: { only_integer: true })
end
