module DistrictsHelper

  def display_district(district_id)
        
    if district_id
      district_text = District.find(district_id).name
    else
      district_text = ''
    end

    return district_text
  end

  def options_for_district(election_id = false)
    districts = Array.new

    if election_id
      # Get the districts for a particular election
      Election.find(election_id).districts.order('name ASC').each do |j|
        districts.push([j.name, j.id])
      end
    else 
      # Get all districts
      District.all.order('name ASC').each do |j|
        districts.push([j.name, j.id])
      end
    end

    return districts
  end
end
