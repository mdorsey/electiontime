class AddUserTypeIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_type_id, :integer
  end
end
