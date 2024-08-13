class AddDistanceToCoach < ActiveRecord::Migration[7.1]
  def change
    add_column :coaches, :distance, :string
    add_column :coaches, :duration, :string
  end
end
