class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :name
      t.float :price
      t.string :image
      t.boolean :foil
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
