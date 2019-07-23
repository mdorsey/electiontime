module DistrictsHelper

  def display_district(district_id)

    district_name = '';
    
    if district_id
      district_name = District.find(district_id).name
    end

    return district_name
  end

  def options_for_district
    districts = Array.new

    District.all.order('name ASC').each do |j|
      districts.push([j.name, j.id])
    end

    return districts
  end
end
