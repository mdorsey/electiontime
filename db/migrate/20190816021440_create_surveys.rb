class CreateSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :surveys do |t|
      t.string :name
      t.string :description
      t.references :survey_type, foreign_key: true
      t.references :election, foreign_key: true

      t.timestamps
    end
  end
end
