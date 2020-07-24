module SocialMediaTypesHelper

  def display_social_media_type(social_media_type_id)
    return SocialMediaType.find(social_media_type_id).name
  end

  def options_for_social_media_type
    social_media_types = Array.new

    SocialMediaType.all.order('name ASC').each do |j|
      social_media_types.push([j.name, j.id])
    end

    return social_media_types
  end

  def get_social_media_type_icon(social_media_type_id)

    icon_url = ''
    icon = SocialMediaType.find(social_media_type_id).icon

    unless icon.empty?
      icon_url = 'social_media_icons/' + icon
    end

    return icon_url
  end
end
