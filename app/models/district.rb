require 'csv'

class District < ApplicationRecord

  belongs_to :office
  has_many :participants, dependent: :nullify

  validates(:name, presence: true, length: { maximum: 255 })
  validates(:office, presence: true)

  def self.search(search_text)
    if search_text
      where('name LIKE ?', "%#{search_text}%")
    else
      unscoped
    end
  end

  # Bulk upload of offices and districts into an election
  def self.import(file, election_id, overwrite)

    new_offices_count = 0
    new_districts_count = 0
    order = 1
    errors = Array.new
    election = Election.find(election_id)

    # Verify the file type
    if file.content_type != "text/csv"
      errors << "File is of type '" + file.content_type + "'. It must be a CSV."
    else

      # Error checking
      CSV.foreach(file.path, headers: true).with_index do |row, i|

        row_number = (i + 1).to_s

        if row[0].blank?
          errors << "Row " + row_number + " has a blank Office"
        end

        if row[1].blank?
          errors << "Row " + row_number + " has a blank District"
        end
      end
    end

    if errors.empty?
      if overwrite == "1"
        # Remove all previously existing offices and districts for this election
        election.offices.each do |o|
          o.districts.destroy_all
        end
        election.offices.destroy_all
      end

      # Create each office and district as part of this election
      CSV.foreach(file.path, headers: true) do |row|

        office_name = row[0]
        district_name = row[1]

        current_office = election.offices.find_by(name: office_name)

        if !current_office
          current_office = election.offices.create(name: office_name, order: order)
          new_offices_count += 1
          order += 1
        end

        if current_office.districts.create(name: district_name).valid?
          new_districts_count += 1
        end
      end
    end

    return [errors, new_offices_count, new_districts_count]
  end
end
