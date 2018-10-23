class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.text :name
      t.integer :price
      t.text :image
      t.integer :steam_id
      t.integer :foil

      t.timestamps
    end
  end
end
