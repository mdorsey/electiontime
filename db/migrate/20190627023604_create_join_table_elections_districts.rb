class CreateJoinTableElectionsDistricts < ActiveRecord::Migration[5.2]
  def change
    create_join_table :elections, :districts do |t|
      t.index [:election_id, :district_id]
      t.index [:district_id, :election_id]
    end
  end
end
