class CreateBackgrounds < ActiveRecord::Migration[5.1]
  def change
    create_table :backgrounds do |t|
      t.text :name
      t.integer :price
      t.text :url
      t.integer :appid

      t.timestamps
    end
  end
end
