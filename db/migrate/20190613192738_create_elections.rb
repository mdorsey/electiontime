class CreateElections < ActiveRecord::Migration[5.2]
  def change
    create_table :elections do |t|
      t.string :name
      t.datetime :election_date
      t.references :election_type, foreign_key: true
      t.references :jurisdiction, foreign_key: true

      t.timestamps
    end
  end
end
