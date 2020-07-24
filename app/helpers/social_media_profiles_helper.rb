module SocialMediaProfilesHelper

  def social_media_profile_link(social_media_profile_id)

    link = ''
    social_media_profile = SocialMediaProfile.find(social_media_profile_id)

    if social_media_profile
      link = SocialMediaType.find(social_media_profile.social_media_type_id).website + social_media_profile.handle
    end

    return link
  end
end
