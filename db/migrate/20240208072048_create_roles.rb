class CreateRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :roles do |t|
      t.string :role, null: false, limit: 45
      t.timestamps
    end
  end
end
