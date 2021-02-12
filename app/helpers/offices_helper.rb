module OfficesHelper

  def display_office(office_id)
    office = Office.find(office_id)
    office_text = office.name + ' (' + display_election(office.election_id) + ')'
    return office_text
  end
end
