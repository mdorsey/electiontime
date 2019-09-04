module DistrictsHelper

  def display_district(district_id)
        
    if district_id
      district_text = District.find(district_id).name
    else
      district_text = ''
    end

    return district_text
  end

  def options_for_district
    districts = Array.new

    District.all.order('name ASC').each do |j|
      districts.push([j.name, j.id])
    end

    return districts
  end
end
