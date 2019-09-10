class Election < ApplicationRecord
  
  belongs_to :election_type
  belongs_to :jurisdiction
  has_and_belongs_to_many :districts
  has_and_belongs_to_many :participants
  has_many :surveys

  validates(:name, presence: true, length: { maximum: 255 })
  validates(:election_date, presence: true)
  validates(:election_type, presence: true)
  validates(:jurisdiction, presence: true)

  before_destroy :allow_destroy

  private

    # Before deletion, check if the object is in use
    def allow_destroy
      unless surveys.empty?
        throw :abort
      end
    end
end
