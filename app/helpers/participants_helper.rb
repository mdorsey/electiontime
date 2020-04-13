module ParticipantsHelper

  def display_participant(participant_id)
    
    if participant_id
      participant = Participant.find(participant_id)
      participant_name = participant.participant_name_for_display
    else
      participant_name = ''
    end

    return participant_name
  end

  def options_for_participant
    participants = Array.new

    Participant.all.order(name: :asc).each do |j|
      participants.push([display_participant(j.id), j.id])
    end

    return participants
  end

  def get_participant_picture_url(participant_id)

    # Start with the default picture
    picture_url = Rails.configuration.blank_avatar_name

    if participant_id
      participant = Participant.find(participant_id)

      if participant.picture.attached?
        picture_url = url_for(participant.picture)
      end
    end

    return picture_url
  end

  def setup_participant_form(participant)
    # If the participant doesn't have an address, then create a new unsaved one that will be persisted when the form is submitted
    participant.address ||= Address.new
    
    return participant
  end
end
