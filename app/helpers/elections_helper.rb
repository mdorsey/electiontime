module ElectionsHelper

  def display_election(election_id)
    return Election.find(election_id).name
  end

  def options_for_election
    elections = Array.new

    Election.all.order('name ASC').each do |j|
      elections.push([j.name, j.id])
    end

    return elections
  end
end
