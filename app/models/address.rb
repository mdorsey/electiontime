class Address < ApplicationRecord

  belongs_to :province
  has_one :participant

  validates(:street, length: { maximum: 255 })
  validates(:city, length: { maximum: 255 })
  validates(:postal_code, length: { maximum: 255 })
end
