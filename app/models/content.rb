class Content < ApplicationRecord

  belongs_to :language
  belongs_to :content_location

  validates(:name, presence: true, length: { maximum: 255 })
  validates(:content, presence: true)
  validates(:language, presence: true)
  validates(:content_location, presence: true)

  def self.search(search_text)
    if search_text
      where('name LIKE ?', "%#{search_text}%")
    else
      unscoped
    end
  end
end
