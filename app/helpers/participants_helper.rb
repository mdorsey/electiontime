module ParticipantsHelper

  def display_participant(participant_id, name_only = false)
    if participant_id
      participant_name = Participant.find(participant_id).participant_name_for_display(name_only)
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

    # Start with the default picture from the System Settings
    picture_url = SystemSetting.find_by(name: "blank_avatar_name").setting

    if participant_id
      participant = Participant.find(participant_id)

      if participant.picture.attached?
        picture_url = participant.picture.variant(resize_to_fill: [128, 128])
      end
    end

    return picture_url
  end
end
