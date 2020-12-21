module ElectionsHelper

  def display_election(election_id)
    return Election.find(election_id).name
  end

  def display_election_date(election_date)
    return election_date.strftime("%B %d, %Y")
  end

  def options_for_election
    elections = Array.new

    Election.all.order('name ASC').each do |j|
      elections.push([j.name, j.id])
    end

    return elections
  end

  def get_election_picture_url(election_id)

    picture_url = ''

    if election_id
      election = Election.find(election_id)

      if election.picture.attached?
        picture_url = election.picture
      end
    end

    return picture_url
  end
end
