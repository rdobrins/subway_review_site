class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :up, default: false
      t.integer :user_id, null: false
      t.integer :review_id, null: false
    end
    add_index :votes, [:user_id, :review_id], unique: true
  end
end
