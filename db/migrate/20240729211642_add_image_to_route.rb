class AddImageToRoute < ActiveRecord::Migration[7.1]
  def change
    add_column :routes, :image, :string
  end
end
