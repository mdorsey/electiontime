class CreateOffices < ActiveRecord::Migration[6.0]
  def change
    create_table :offices do |t|
      t.string :name
      t.integer :order
      t.references :election, foreign_key: true

      t.timestamps
    end
  end
end
