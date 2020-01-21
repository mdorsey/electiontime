class ChangeContentsColumns < ActiveRecord::Migration[5.2]
  def change
    rename_column :contents, :location, :name
    remove_column :contents, :machine_name, :string
    add_reference :contents, :content_location, foreign_key: true
  end
end
