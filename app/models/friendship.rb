class Friendship < ApplicationRecord
  belongs_to :user_one, class_name: 'User', foreign_key: 'user_one_id', required: true
  belongs_to :user_two, class_name: 'User', foreign_key: 'user_two_id', required: true
  enum accepted: { not_friends: 0, pending: 1, accepted: 2 }
end
