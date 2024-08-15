class AddNameToCoaches < ActiveRecord::Migration[7.1]
  def change
    add_column :coaches, :name, :string
  end
end
