class AddConstraintsToReviewStarCount < ActiveRecord::Migration
  def up
    remove_column :reviews, :rating
    add_column :reviews, :rating, :integer, null: false

  end

  def down
    remove_column :reviews, :rating
    add_column :reviews, :rating, :string, null: false
  end
end
