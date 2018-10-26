class ChangeIdOfGameRating < ActiveRecord::Migration[5.1]
  def change
	  rename_column :game_ratings, :id, :game_id
	  add_column :game_ratings, :gamer_id, :integer
  end
end
