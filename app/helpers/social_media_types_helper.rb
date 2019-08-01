module SocialMediaTypesHelper

  def display_social_media_type(social_media_type_id)
    return SocialMediaType.find(social_media_type_id).name
  end

  def options_for_social_media_type
    social_media_types = Array.new

    SocialMediaType.all.order('name ASC').each do |s|
      social_media_types.push([s.name, s.id])
    end

    return social_media_types
  end
end
