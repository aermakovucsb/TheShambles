class AddUserTypeToGamers < ActiveRecord::Migration[5.1]
  def change
    add_column :gamers, :user_type, :string
  end
end
