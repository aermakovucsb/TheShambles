class DropChefs < ActiveRecord::Migration[5.1]
  def change
  	 drop_table :chefs
  end
end
