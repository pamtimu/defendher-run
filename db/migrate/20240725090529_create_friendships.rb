class CreateFriendships < ActiveRecord::Migration[7.1]
  def change
    create_table :friendships do |t|
      t.references :user_one, null: false, foreign_key: {to_table: :users}
      t.references :user_two, null: false, foreign_key: {to_table: :users}
      t.boolean :accepted

      t.timestamps
    end
  end
end
