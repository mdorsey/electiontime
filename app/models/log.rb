class Log < ApplicationRecord

  belongs_to :user
  belongs_to :log_type

  validates(:user, presence: true)
  validates(:log_type, presence: true)
  validates(:message, presence: true, length: { maximum: 255 })
  validates(:location, presence: true, length: { maximum: 255 })
end
