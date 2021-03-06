class Station < ActiveRecord::Base
  has_many :reviews
  belongs_to :user

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
    reviews = Review.where("station_id = ?", id)
    reviews.each do |review|
      ratings << review.rating
    end

    total = 0
    if ratings == []
      return "0"
    end
    ratings.each do |rating|
      total += rating
    end

    (total / ratings.length.to_f).round(1)
  end

  def self.search(query)
    where("lower(name) like ?", "%#{query}%".downcase)
  end
end
