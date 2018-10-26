class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.integer :steam_id
      t.string :status
      t.references :gamer, foreign_key: true

      t.timestamps
    end
  end
end
