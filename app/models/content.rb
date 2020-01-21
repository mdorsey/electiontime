class Content < ApplicationRecord

  belongs_to :language
  belongs_to :content_location

  validates(:name, presence: true, length: { maximum: 255 })
  validates(:content, presence: true)
  validates(:language, presence: true)
  validates(:content_location, presence: true)
end
