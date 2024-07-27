class Route < ApplicationRecord
  has_many :saved_routes
  scope :running_sessions, -> { where(active: true) }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
