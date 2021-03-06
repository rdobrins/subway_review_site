class User < ActiveRecord::Base
  has_many :reviews
  has_many :votes
  has_many :stations

  devise :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  mount_uploader :avatar, AvatarUploader

  def admin?
    role == "admin"
  end
end
