class Party < ApplicationRecord

  has_many :participants

  validates(:name, presence: true, length: { maximum: 255 })
  validates(:name_abbreviation, length: { maximum: 255 })
  validates(:alternate_name, length: { maximum: 255 })
  validates(:alternate_abbreviation, length: { maximum: 255 })

  before_destroy :allow_destroy

  private

    # Before deletion, check if the object is in use
    def allow_destroy
      unless participants.empty?
        throw :abort
      end
    end
end
