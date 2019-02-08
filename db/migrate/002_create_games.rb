class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.references :player, foreign_key: { to_table: :users }, index: true, null: false
      t.references :opponent, foreign_key: { to_table: :users }, index: true, null: false
      t.float :player_score
      t.float :opponent_score
      t.datetime :played_at

      t.timestamps
    end
  end
end
