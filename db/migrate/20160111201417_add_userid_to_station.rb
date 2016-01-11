class AddUseridToStation < ActiveRecord::Migration
  def up
    add_column :stations, :user_id, :integer, null: false
  end
  def down
    remove_column :stations, :user_id
  end
end
