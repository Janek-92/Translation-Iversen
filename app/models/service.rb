class Service < ApplicationRecord
  CATEGORIES = ["Literary Translation", "Legal Translation", "Technical Translation", "Simultaneous Interpretation", "Consecutive Interpretation", "Over-the-phone Interpretation"]
  PRIMARY_LANGUAGE = ["English", "French", "German", "Spanish", "Italian", "Greek", "Arabic", "Turkish", "Polish", "Chinese", "Japanese" ]
  TYPES = ["Remote", "On-Site"]
  validates :category, inclusion: { in: CATEGORIES }
  validates :primary_language, inclusion: { in: PRIMARY_LANGUAGE }
  validates :type_of_service, inclusion: { in: TYPES }
  belongs_to :user
  geocoded_by :address, through: :users
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_one_attached :photo
end
