class LogType < ApplicationRecord
  validates(:name, presence: true, length: { maximum: 255 })
end
