class Jurisdiction < ApplicationRecord

  has_many :elections
  has_many :districts

  validates(:name, presence: true, length: { maximum: 255 })

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
      unless (elections.empty? && districts.empty?)
        throw :abort
      end
    end
end
