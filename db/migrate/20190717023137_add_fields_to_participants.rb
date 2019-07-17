class AddFieldsToParticipants < ActiveRecord::Migration[5.2]
  def change
    add_column :participants, :phone, :string
    add_column :participants, :is_candidate, :boolean
    add_reference :participants, :address, foreign_key: true
    add_reference :participants, :district, foreign_key: true
    add_reference :participants, :party, foreign_key: true
    add_column :participants, :leader_participant_id, :bigint, null: true, index: true
    add_foreign_key :participants, :participants, column: :leader_participant_id
  end
end
