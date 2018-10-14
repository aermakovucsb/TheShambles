class AddPasswordDigestToGamers < ActiveRecord::Migration[5.1]
  def change
  	add_column :gamers, :password_digest, :string
  end
end
