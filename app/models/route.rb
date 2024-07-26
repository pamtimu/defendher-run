class Route < ApplicationRecord
  has_many :saved_routes
  scope :running_sessions, -> { where(active: true) }
end
