class AcceptedInfriendships < ActiveRecord::Migration[7.1]
  def change
    change_column :friendships, :accepted, 'integer USING CAST(accepted AS integer)'
  end
end


