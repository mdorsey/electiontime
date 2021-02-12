class AddIsPartyLeaderToParticipants < ActiveRecord::Migration[6.0]
  def change
    add_column :participants, :is_party_leader, :boolean, default: false
  end
end
