class AddRunninglevelToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :running_level, :string
  end
end
