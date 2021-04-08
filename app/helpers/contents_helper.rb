module ContentsHelper

  def display_content(content_location_name)

    display_content = ''

    location = ContentLocation.find_by(name: content_location_name)
    if location
      content = Content.find_by(content_location_id: location.id)
      if content
        display_content = content.content
      end
    end

    return display_content
  end
end
