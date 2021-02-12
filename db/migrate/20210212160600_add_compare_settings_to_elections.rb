class AddCompareSettingsToElections < ActiveRecord::Migration[6.0]
  def change
    add_column :elections, :compare_parties, :boolean, default: false
    add_column :elections, :compare_party_leaders, :boolean, default: false
  end
end
