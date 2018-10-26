class AddGameIdToBackground < ActiveRecord::Migration[5.1]
  def change
	  add_column :backgrounds, :game_id, :integer
	  add_index :backgrounds, :game_id
  end
end
