class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.boolean :like 
      t.integer :gamer_id
      t.integer :game_id
      t.timestamps
    end
  end
end
