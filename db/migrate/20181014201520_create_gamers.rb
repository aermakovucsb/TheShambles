class CreateGamers < ActiveRecord::Migration[5.1]
  def change
    create_table :gamers do |t|
    	create_table :chefs
		t.string :gamername
		t.string :email
		t.timestamps
    end
  end
end
