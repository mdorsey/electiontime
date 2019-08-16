module ElectionTypesHelper

  def display_election_type(election_type_id)
    return ElectionType.find(election_type_id).name
  end

  def options_for_election_type
    election_types = Array.new

    ElectionType.all.order('name ASC').each do |j|
      election_types.push([j.name, j.id])
    end

    return election_types
  end
end
