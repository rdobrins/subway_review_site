class Review < ActiveRecord::Base
  belongs_to :station

  validates :user_id, presence: true
end
