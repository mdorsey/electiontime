module ElectionTypesHelper

  def display_election_type(election_type_id)
    return ElectionType.find(election_type_id).name
  end
end
