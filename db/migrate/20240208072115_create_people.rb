class CreatePeople < ActiveRecord::Migration[7.1]
  def change
    create_table :people do |t|
      t.string :gender, null: false, limit: 45
      t.string :first_name, null: false, limit: 255
      t.string :last_name, null: false, limit: 255
      t.datetime :birth_date, null: false
      t.string :address, null: false, limit: 255
      t.string :phone_number, null: false, limit: 45
      t.string :email, null: false, limit: 255
      t.references :locality, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true
      t.timestamps
    end
  end
end
