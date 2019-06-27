module ElectionTypesHelper

  def display_election_type(election_type_id)
    return ElectionType.find(election_type_id).name
  end

  def options_for_election_type
    election_types = Array.new

    ElectionType.all.order('name ASC').each do |et|
      election_types.push([et.name, et.id])
    end

    return election_types
  end
end
