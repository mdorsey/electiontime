class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :location
      t.mediumtext :content
      t.string :machine_name
      t.references :language, foreign_key: true

      t.timestamps
    end
  end
end
