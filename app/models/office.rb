class Office < ApplicationRecord
  
  belongs_to :election

  validates(:name, presence: true, length: { maximum: 255 })
  validates(:order, presence: true, numericality: { only_integer: true })

  def self.search(search_text)
    if search_text
      where('name LIKE ?', "%#{search_text}%")
    else
      unscoped
    end
  end
end
