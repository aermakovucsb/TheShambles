class AddTypeToGamers < ActiveRecord::Migration[5.1]
  def change
    add_column :gamers, :type, :string
  end
end
