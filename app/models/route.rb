class Route < ApplicationRecord
  validates :address, presence: true
  validates :distance, presence: true
  has_many :saved_routes
  scope :running_sessions, -> { where(active: true) }
  geocoded_by :address
  #has_one_attached :image
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_name_and_address,
    against: [ :name, :address ],
    using: {
      tsearch: { prefix: true }
    }
end
