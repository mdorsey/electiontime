class Survey < ApplicationRecord

  belongs_to :survey_type
  belongs_to :election
  has_many :survey_questions

  validates(:name, presence: true, length: { maximum: 255 })
  validates(:description, length: { maximum: 255 })
  validates(:survey_type, presence: true)
  validates(:election, presence: true)

  before_destroy :allow_destroy

  def self.search(search_text)
    if search_text
      where('name LIKE ?', "%#{search_text}%")
    else
      unscoped
    end
  end

  private

    # Before deletion, check if the object is in use
    def allow_destroy
      unless survey_questions.empty?
        throw :abort
      end
    end
end
