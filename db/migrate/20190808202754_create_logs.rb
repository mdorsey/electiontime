class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.references :user, foreign_key: true
      t.references :log_type, foreign_key: true
      t.string :message
      t.string :location

      t.timestamps
    end
  end
end
