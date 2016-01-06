class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :rating, null: false
      t.text :body
      t.integer :up_votes, null: false, default: 0
      t.integer :down_votes, null: false, default: 0
      t.integer :user_id, null: false
      t.integer :station_id, null: false
    end
  end
end
