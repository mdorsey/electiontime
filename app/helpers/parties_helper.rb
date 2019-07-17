module PartiesHelper

  def display_party(party_id)
    return Party.find(party_id).name
  end

  def options_for_party
    parties = Array.new

    Party.all.order('name ASC').each do |j|
      parties.push([j.name, j.id])
    end

    return parties
  end
end
