class Coach < ApplicationRecord
  validates :duration, presence: true
  validates :distance, presence: true

end
