class Service < ApplicationRecord
  CATEGORIES = ["Literary Translation", "Legal Translation", "Technical Translation", "Simultaneous Interpretation", "Consecutive Interpretation", "Over-the-phone Interpretation"]
  PRIMARY_LANGUAGE = ["English", "French", "German", "Spanish", "Italian", "Greek", "Arabic", "Turkish", "Polish", "Chinese", "Japanese" ]
  validates :category, inclusion: { in: CATEGORIES }
  validates :primary_language, inclusion: { in: PRIMARY_LANGUAGE }
  belongs_to :user

  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

end
