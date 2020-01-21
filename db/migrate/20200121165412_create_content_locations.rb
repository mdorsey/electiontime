class CreateContentLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :content_locations do |t|
      t.string :name

      t.timestamps
    end
  end
end
