class SystemSetting < ApplicationRecord
  validates(:name, presence: true, length: { maximum: 255 })
  validates(:setting, presence: true, length: { maximum: 255 })
end
