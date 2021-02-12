class RemoveElectionTypeFromDistricts < ActiveRecord::Migration[6.0]
  def change
    remove_reference :districts, :election_type, null: false, foreign_key: true
  end
end
