module ElectionsHelper

  def options_for_election_type
    election_types = Array.new

    ElectionType.all.order('name ASC').each do |et|
      election_types.push([et.name, et.id])
    end

    return election_types
  end

  def options_for_jurisdiction
    jurisdictions = Array.new

    Jurisdiction.all.order('name ASC').each do |j|
      jurisdictions.push([j.name, j.id])
    end

    return jurisdictions
  end
end
