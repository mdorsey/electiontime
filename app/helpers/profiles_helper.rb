module ProfilesHelper

  def display_profile_title(participant)
    
    if participant
      if (participant.is_candidate)
        profile_title = display_user(participant.user_id, true)
      else
        profile_title = display_party(participant.party_id)
      end
    else
      profile_title = ''
    end

    return profile_title
  end
end
