class ChangeReviewVotesDefaultValues < ActiveRecord::Migration
  def up
    change_column :reviews, :up_votes, :integer, default: 0
    change_column :reviews, :down_votes, :integer, default: 0
  end

  def down
    change_column :reviews, :up_votes, :integer
    change_column :reviews, :down_votes, :integer
  end
end
