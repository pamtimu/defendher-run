class AddDefaultValueToAcceptedInFriendships < ActiveRecord::Migration[7.1]
  def change
    change_column_default :friendships, :accepted, from: nil, to: 0
  end
end
