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

  # Bulk upload of districts into an election
  def self.import(file, election_id, jurisdiction_id, overwrite)

    count = 0
    errors = Array.new
    election = Election.find(election_id)

    # Verify the file type
    if file.content_type != "text/csv"
      errors << "File is of type '" + file.content_type + "'. It must be a CSV."
      count += 1
    else
      # Test that each object will be created successfully
      CSV.foreach(file.path, headers: false).with_index do |row, i|
        if !District.new(name: row[0], jurisdiction_id: jurisdiction_id, election_type_id: election.election_type_id).valid?
          errors << "Row " + i.to_s
          count += 1
        end
      end
    end

    if errors.empty?
      if overwrite == "1"
        # Remove all previously existing districts for this election
        election.districts.delete_all
      end

      # Create each district and add it to the election
      CSV.foreach(file.path, headers: true) do |row|
        if election.districts.create(name: row[0], jurisdiction_id: jurisdiction_id, election_type_id: election.election_type_id).valid?
          count += 1
        end
      end
    end

    return [count, errors]
  end
end
