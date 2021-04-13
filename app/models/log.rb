class Log < ApplicationRecord

  belongs_to :log_type

  validates(:log_type, presence: true)
  validates(:message, presence: true, length: { maximum: 255 })
  validates(:location, length: { maximum: 255 })

  def self.search(search_text)
    if search_text
      where('message LIKE ?', "%#{search_text}%")
    else
      unscoped
    end
  end
end
