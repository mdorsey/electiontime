class CreateDistricts < ActiveRecord::Migration[5.2]
  def change
    create_table :districts do |t|
      t.string :name
      t.references :election_type, foreign_key: true
      t.references :jurisdiction, foreign_key: true

      t.timestamps
    end
  end
end
