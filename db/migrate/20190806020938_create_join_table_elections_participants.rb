class CreateJoinTableElectionsParticipants < ActiveRecord::Migration[5.2]
  def change
    create_join_table :elections, :participants do |t|
      t.index [:election_id, :participant_id]
      t.index [:participant_id, :election_id]
    end
  end
end
