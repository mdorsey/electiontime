class CreateJurisdictions < ActiveRecord::Migration[5.2]
  def change
    create_table :jurisdictions do |t|
      t.string :name

      t.timestamps
    end
  end
end
