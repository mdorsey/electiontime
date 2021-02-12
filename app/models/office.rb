class Office < ApplicationRecord
  
  belongs_to :election
  has_many :districts
  has_many :participants, dependent: :nullify

  validates(:name, presence: true, length: { maximum: 255 })
  validates(:order, presence: true, numericality: { only_integer: true })
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
      unless districts.empty?
        throw :abort
      end
    end
end
