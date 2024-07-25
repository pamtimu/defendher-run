class SessionPartipant < ApplicationRecord
  belongs_to :user
  belongs_to :running_session
end
