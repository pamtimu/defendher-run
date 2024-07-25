class Chatroom < ApplicationRecord
  belongs_to :user_one, class_name: 'User', foreign_key: 'user_one_id', required: true
  belongs_to :user_two, class_name: 'User', foreign_key: 'user_two_id', required: true
end


