class District < ApplicationRecord

  belongs_to :election_type
  belongs_to :jurisdiction
  has_many :participants, dependent: :nullify
  has_and_belongs_to_many :elections

  validates(:name, presence: true, length: { maximum: 255 })
  validates(:election_type, presence: true)
  validates(:jurisdiction, presence: true)

  def self.search(search_text)
    if search_text
      where('name LIKE ?', "%#{search_text}%")
    else
      unscoped
    end
  end
end
