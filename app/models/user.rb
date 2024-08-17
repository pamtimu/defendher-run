class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #validates :category, inclusion: { in: ["Beginner", "Intermediate", "Novice", "Marathon", "Athlete"] }
  has_many :chatrooms
  has_many :coaches
  has_many :messages

  has_many :session_participants
  has_many :saved_routes
  has_many :routes, through: :saved_routes
  has_one_attached :photo

  def friendships
    Friendship.where(user_one: self) + Friendship.where(user_two: self)
  end

  def friends
    friendships.map do |friendship|
      if friendship.user_one == self
        friendship.user_two
      else
        friendship.user_one
      end
    end
  end

end
