class AddElectionToContents < ActiveRecord::Migration[6.0]
  def change
    add_reference :contents, :election, null: true, foreign_key: true
  end
end
