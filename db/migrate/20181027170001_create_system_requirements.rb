class CreateSystemRequirements < ActiveRecord::Migration[5.1]
  def change
    create_table :system_requirements do |t|
      t.references :game, foreign_key: true
      t.references :processor, foreign_key: true
      t.references :graphic, foreign_key: true
      t.references :memory, foreign_key: true

      t.timestamps
    end
  end
end
