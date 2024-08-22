class Friendship < ApplicationRecord
  belongs_to :user_one, class_name: 'User', foreign_key: 'user_one_id', required: true
  belongs_to :user_two, class_name: 'User', foreign_key: 'user_two_id', required: true
  enum accepted: { not_friends: 0, pending: 1, accepted: 2 }
  validate :unique_friendship, on: :create

  def users
    [user_one, user_two]
  end

  def friend(current_user)
    friend = users - [current_user]
    friend.first
  end

  private

  def unique_friendship
    if user_one.friends.include?(user_two)
      errors.add :base, :duplicate_friendship, message: "Users are already friends!"
    end
  end

end
