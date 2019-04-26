class CreateCandidates < ActiveRecord::Migration[5.2]
  def change
    create_table :candidates do |t|
      t.references :user, foreign_key: true
      t.string :email
      t.string :website
      t.text :biography
      t.boolean :is_incumbent

      t.timestamps
    end
  end
end
