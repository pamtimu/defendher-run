class AddProgramContentToCoaches < ActiveRecord::Migration[7.1]
  def change
    add_column :coaches, :program_content, :text
  end
end
