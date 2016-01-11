class Station < ActiveRecord::Base
  has_many :reviews

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :zip, length: { is: 5 }
  validates :zip, numericality: { only_integer: true }
  paginates_per 10

  def average_rating
    ratings = []
    Review.where("station_id = ?", self.id).each do |rev|
      ratings << rev.rating
    end

    total = 0
    ratings.each do |rat|
      total += rat
    end

    average = (total / ratings.length.to_f).round(1)

  end
end
