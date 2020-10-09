module ComparisonPagesHelper
  def is_participant_an_incumbent(participant_id)
    return Participant.find(participant_id).is_incumbent
  end

  def is_participant_a_candidate(participant_id)
    return Participant.find(participant_id).is_candidate
  end
end
