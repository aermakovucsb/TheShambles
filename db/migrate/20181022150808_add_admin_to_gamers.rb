class AddAdminToGamers < ActiveRecord::Migration[5.1]
  def change
  	add_column :gamers, :admin, :boolean, default: false
  end
end
