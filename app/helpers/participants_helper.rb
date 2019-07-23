module ParticipantsHelper

  def display_participant(participant_id)

    participant_name = '';
    
    if participant_id
      participant = Participant.find(participant_id)
      participant_name = display_user(participant.user_id, false) + ' (' + display_party(participant.party_id) + ')'
    end

    return participant_name
  end

  def options_for_participant
    participants = Array.new

    Participant.all.each do |j|
      participants.push([display_participant(j.id), j.id])
    end

    return participants
  end
end
