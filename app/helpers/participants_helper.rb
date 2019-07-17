module ParticipantsHelper

  def display_participant(participant_id)
    return Participant.find(participant_id).user_id
  end

  def options_for_participant
    participants = Array.new

    Participant.all.order('user_id ASC').each do |j|
      participants.push([j.user_id, j.id])
    end

    return participants
  end
end
