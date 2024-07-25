class RunningSession < ApplicationRecord
  belongs_to :route
  has_one_attached :photo
end
