class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #validates :category, inclusion: { in: ["Beginner", "Intermediate", "Novice", "Marathon", "Athlete"] }
  has_many :chatrooms
  has_many :messages
  has_many :friendships

  has_many :friends, through: :friendships, source: :user_two_id
  
    # Friendships where the user is the recipient
    has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'user_two_id'
    has_many :inverse_friends, through: :inverse_friendships, source: :user

  has_many :session_participants
  has_many :saved_routes
  has_many :routes, through: :saved_routes
  has_one_attached :photo
end
