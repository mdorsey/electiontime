class Address < ApplicationRecord

  belongs_to :province

  validates(:street, presence: true, length: { maximum: 255 })
  validates(:city, presence: true, length: { maximum: 255 })
  validates(:province, presence: true)
  validates(:postal_code, presence: true, length: { maximum: 255 })
end
