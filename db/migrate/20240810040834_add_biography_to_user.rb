class AddBiographyToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :biography, :text, default: "Write a short bio about yourself!"
  end
end
