class CreateJoinTablecompanygame < ActiveRecord::Migration[5.1]
  def change
    create_join_table :companies, :games do |t|
      # t.index [:company_id, :game_id]
      # t.index [:game_id, :company_id]
    end
  end
end
