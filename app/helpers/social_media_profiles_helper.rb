module SocialMediaProfilesHelper

  def display_social_media_profile(social_media_profile_id)

    profile_link = ''
    social_media_profile = SocialMediaProfile.find(social_media_profile_id)

    if social_media_profile
      profile_link = SocialMediaType.find(social_media_profile.social_media_type_id).website + social_media_profile.handle
    end

    return profile_link
  end
end
