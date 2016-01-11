class Review < ActiveRecord::Base
  belongs_to :station
  belongs_to :user
  has_many :votes

  validates :user_id, presence: true
  validates :station_id, presence: true
  validates :user_id, uniqueness: { scope: :station_id,
    message: " has already submitted a review for this station." }
  validates :rating, numericality: true
  validates :rating, inclusion: { in: (1..5) }
  paginates_per 10
end
