class RemoveJurisdictionFromDistricts < ActiveRecord::Migration[6.0]
  def change
    remove_reference :districts, :jurisdiction, null: false, foreign_key: true
  end
end
