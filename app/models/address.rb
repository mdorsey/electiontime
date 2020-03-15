class Address < ApplicationRecord

  belongs_to :province
  has_one :participant

  validates(:street, length: { maximum: 255 })
  validates(:city, length: { maximum: 255 })
  validates(:postal_code, length: { maximum: 255 })

  def self.search(search_text)
    if search_text
      where('street LIKE ? OR city LIKE ?', "%#{search_text}%", "%#{search_text}%")
    else
      unscoped
    end
  end
end
