# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false, limit: 320
      t.string :password_digest, null: false, limit: 60
      t.timestamps

      t.index :email, unique: true
    end
  end
end
