class UserType < ApplicationRecord
  
  has_many :users

  validates(:name, presence: true, length: { maximum: 255 })

  def self.search(search_text)
    if search_text
      where('name LIKE ?', "%#{search_text}%")
    else
      unscoped
    end
  end
end
