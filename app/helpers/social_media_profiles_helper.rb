module SocialMediaProfilesHelper

  def display_social_media_profile(social_media_profile_id)
    social_media_profile = SocialMediaProfile.find(social_media_profile_id)
    profile_text = social_media_profile.handle + ' (' + display_social_media_type(social_media_profile.social_media_type_id) + '), ' + display_participant(social_media_profile.participant_id, true)
    return profile_text
  end
  
  def social_media_profile_link(social_media_profile_id)

    link = ''
    social_media_profile = SocialMediaProfile.find(social_media_profile_id)

    if social_media_profile
      link = SocialMediaType.find(social_media_profile.social_media_type_id).website + social_media_profile.handle
    end

    return link
  end

  def get_social_media_profiles_in_alphabetical_order(participant_id)

    participant = Participant.find(participant_id)
    social_media_profiles = Array.new

    SocialMediaType.all.order(name: :asc).each do |t|
      profile = participant.social_media_profiles.find { |smp| smp.social_media_type_id === t.id }
      if profile
        social_media_profiles << profile
      end
    end

    return social_media_profiles
  end
end
