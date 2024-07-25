class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :chatrooms
  has_many :messages
  has_many :friendships
  has_many :session_participants
  has_many :saved_routes
  has_one_attached :photo
end
