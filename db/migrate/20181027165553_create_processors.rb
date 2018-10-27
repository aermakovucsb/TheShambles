class CreateProcessors < ActiveRecord::Migration[5.1]
  def change
    create_table :processors do |t|
      t.string :name
      t.integer :rank

      t.timestamps
    end
  end
end
