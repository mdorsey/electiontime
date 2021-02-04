class RemoveAddressFromParticipant < ActiveRecord::Migration[6.0]
  def change
    remove_reference :participants, :address, null: false, foreign_key: true
  end
end
