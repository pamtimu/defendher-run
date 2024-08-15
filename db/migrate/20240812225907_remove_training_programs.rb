class RemoveTrainingPrograms < ActiveRecord::Migration[7.1]
  def change
    drop_table :training_programs
  end
end
