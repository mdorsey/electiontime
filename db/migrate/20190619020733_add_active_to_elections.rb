class AddActiveToElections < ActiveRecord::Migration[5.2]
  def change
    add_column :elections, :active, :boolean, default: false
  end
end
