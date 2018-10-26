class CreateJoinTableGamesGamers < ActiveRecord::Migration[5.1]
  def change
    create_join_table :games, :gamers do |t|
      # t.index [:game_id, :gamer_id]
      # t.index [:gamer_id, :game_id]
    end
  end
end
