class Survey < ApplicationRecord

  belongs_to :survey_type
  belongs_to :election

  validates(:name, presence: true, length: { maximum: 255 })
  validates(:description, length: { maximum: 255 })
  validates(:survey_type, presence: true)
  validates(:election, presence: true)
end
