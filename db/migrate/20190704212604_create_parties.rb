class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.string :name
      t.string :name_abbreviation
      t.string :alternate_name
      t.string :alternate_abbreviation

      t.timestamps
    end
  end
end
