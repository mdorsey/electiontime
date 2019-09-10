class Language < ApplicationRecord

  has_many :contents

  validates(:name, presence: true, length: { maximum: 255 })

  before_destroy :allow_destroy

  private

    # Before deletion, check if the object is in use
    def allow_destroy
      unless contents.empty?
        throw :abort
      end
    end
end
