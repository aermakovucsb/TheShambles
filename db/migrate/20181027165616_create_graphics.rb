class CreateGraphics < ActiveRecord::Migration[5.1]
  def change
    create_table :graphics do |t|
      t.string :name
      t.integer :rank

      t.timestamps
    end
  end
end
