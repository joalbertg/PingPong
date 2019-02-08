class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.references :user, foreign_key: true, null: false, index: true
      t.references :game, foreign_key: true, null: false, index: true
      t.integer :won, null: false, default: 0
      t.integer :lost, null: false, default: 0

      t.timestamps
    end
  end
end
