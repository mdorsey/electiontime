class ChangeCandidatesToParticipants < ActiveRecord::Migration[5.2]
  def change
    rename_table :candidates, :participants
  end
end
