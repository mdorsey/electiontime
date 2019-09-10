class SurveyType < ApplicationRecord

  has_many :surveys

  validates(:name, presence: true, length: { maximum: 255 })

  before_destroy :allow_destroy

  private

    # Before deletion, check if the object is in use
    def allow_destroy
      unless surveys.empty?
        throw :abort
      end
    end
end
