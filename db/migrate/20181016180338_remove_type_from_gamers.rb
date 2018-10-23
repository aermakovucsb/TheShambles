class RemoveTypeFromGamers < ActiveRecord::Migration[5.1]
  def change
    remove_column :gamers, :type, :string
  end
end
