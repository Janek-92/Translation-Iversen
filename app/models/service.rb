class Service < ApplicationRecord
  CATEGORIES = ["Literary Translation", "Legal Translation", "Technical Translation", "Simultaneous Interpretation", "Consecutive Interpretation", "Over-the-phone Interpretation"]
  validates :category, inclusion: { in: CATEGORIES }
  belongs_to :user

  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
end
