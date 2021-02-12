class RemoveLeaderParticipantFromParticipants < ActiveRecord::Migration[6.0]
  def change
    remove_reference :participants, :leader_participant, null: false
  end
end
