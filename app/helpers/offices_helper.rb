module OfficesHelper

  def display_office(office_id)
    office = Office.find(office_id)
    office_text = office.name + ' (' + display_election(office.election_id) + ')'
    return office_text
  end

  def options_for_office
    offices = Array.new

    Office.all.order('name ASC').each do |j|
      offices.push([j.name, j.id])
    end

    return offices
  end
end
