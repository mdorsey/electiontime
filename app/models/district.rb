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

    new_districts_count = 0
    errors = Array.new
    election = Election.find(election_id)

    # Verify the file type
    if file.content_type != "text/csv"
      errors << "File is of type '" + file.content_type + "'. It must be a CSV."
    else

      # Error checking
      CSV.foreach(file.path, headers: true).with_index do |row, i|

        row_number = (i + 1).to_s

        if !District.new(name: row[0], jurisdiction_id: jurisdiction_id, election_type_id: election.election_type_id).valid?
          errors << "Row " + row_number + " has an invalid District"
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
          new_districts_count += 1
        end
      end
    end

    return [errors, new_districts_count]
  end
end
