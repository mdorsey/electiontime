class Election < ApplicationRecord
  
  belongs_to :election_type
  belongs_to :jurisdiction

  validates(:name, presence: true, length: { maximum: 255 })
  validates(:election_date, presence: true)
  validates(:election_type, presence: true)
  validates(:jurisdiction, presence: true)
end
