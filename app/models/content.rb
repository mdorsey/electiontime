class Content < ApplicationRecord

  belongs_to :language

  validates(:location, presence: true, length: { maximum: 255 })
  validates(:content, presence: true)
  validates(:machine_name, presence: true, length: { maximum: 255 })
  validates(:language, presence: true)
end
