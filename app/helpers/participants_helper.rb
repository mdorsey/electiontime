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

    Participant.all.each do |j|
      participants.push([display_participant(j.id), j.id])
    end

    return participants
  end
end
