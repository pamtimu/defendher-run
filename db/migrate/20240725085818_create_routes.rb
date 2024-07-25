class CreateRoutes < ActiveRecord::Migration[7.1]
  def change
    create_table :routes do |t|
      t.string :address
      t.decimal :distance

      t.timestamps
    end
  end
end
