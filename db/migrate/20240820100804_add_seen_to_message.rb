class AddSeenToMessage < ActiveRecord::Migration[7.1]
  def change
    add_column :messages, :seen, :boolean, default: false
  end
end
