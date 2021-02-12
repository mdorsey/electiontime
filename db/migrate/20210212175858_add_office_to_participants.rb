class AddOfficeToParticipants < ActiveRecord::Migration[6.0]
  def change
    add_reference :participants, :office, foreign_key: true
  end
end
