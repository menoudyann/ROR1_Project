# frozen_string_literal: true

class AddDeviseToPeople < ActiveRecord::Migration[7.1]
  def self.up
    change_table :people do |t|
      ## Database authenticatable
      t.string :encrypted_password, null: false, default: ""
      ## Rememberable
      t.datetime :remember_created_at
    end

    add_index :people, :email,                unique: true
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
