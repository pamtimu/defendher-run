class Route < ApplicationRecord
  validates :address, :distance, presence: true
  has_many :saved_routes
  scope :running_sessions, -> { where(active: true) }
  geocoded_by :address
  has_one_attached :image
  after_validation :geocode, if: :will_save_change_to_address?
end
