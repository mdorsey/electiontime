class ChangeHistoryTypesToLogTypes < ActiveRecord::Migration[5.2]
  def change
    rename_table :history_types, :log_types
  end
end
