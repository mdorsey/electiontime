class DropJoinTableElectionsDistricts < ActiveRecord::Migration[6.0]
  def change
    drop_join_table :elections, :districts
  end
end
