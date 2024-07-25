class CreateRunningSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :running_sessions do |t|
      t.references :route, null: false, foreign_key: true
      t.date :date
      t.integer :duration

      t.timestamps
    end
  end
end
