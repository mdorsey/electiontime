class LogType < ApplicationRecord

  has_many :logs

  validates(:name, presence: true, length: { maximum: 255 })

  before_destroy :allow_destroy

  private

    # Before deletion, check if the object is in use
    def allow_destroy
      unless logs.empty?
        throw :abort
      end
    end
end
