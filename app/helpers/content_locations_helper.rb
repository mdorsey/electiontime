module ContentLocationsHelper

  def display_content_location(content_location_id)
    return ContentLocation.find(content_location_id).name
  end

  def options_for_content_location
    content_locations = Array.new

    ContentLocation.all.order('name ASC').each do |j|
      content_locations.push([j.name, j.id])
    end

    return content_locations
  end
end
