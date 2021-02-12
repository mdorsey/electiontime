module DistrictsHelper

  def display_district(district_id)
        
    if district_id
      district_text = District.find(district_id).name
    else
      district_text = ''
    end

    return district_text
  end

  def options_for_district(office_id = false)
    districts = Array.new

    if office_id
      # Get the districts for a particular office
      Office.find(office_id).districts.order('name ASC').each do |j|
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
