class Route < ApplicationRecord
  has_many :saved_routes, :running_sessions
end
