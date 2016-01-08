class ReviewsIndex < ActiveRecord::Migration
  def up
    add_index :reviews, [:user_id, :station_id], unique: true
  end

  def down
    remove_index :reviews, [:user_id, :station_id]
  end
end
