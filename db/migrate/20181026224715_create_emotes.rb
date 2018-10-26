class CreateEmotes < ActiveRecord::Migration[5.1]
  def change
    create_table :emotes do |t|
      t.string :name
      t.float :price
      t.string :image
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
