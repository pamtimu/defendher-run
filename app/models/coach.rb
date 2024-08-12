class Coach < ApplicationRecord
  belongs_to :user
  validates :duration, presence: true
  validates :distance, presence: true
end
