class SystemSetting < ApplicationRecord
  validates(:name, presence: true, length: { maximum: 255 })
  validates(:setting, presence: true, length: { maximum: 255 })

  def self.search(search_text)
    if search_text
      where('name LIKE ? OR setting LIKE ?', "%#{search_text}%", "%#{search_text}%")
    else
      unscoped
    end
  end
end
