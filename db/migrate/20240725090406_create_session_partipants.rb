class CreateSessionPartipants < ActiveRecord::Migration[7.1]
  def change
    create_table :session_partipants do |t|
      t.references :user, null: false, foreign_key: true
      t.references :running_session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
