class CreatePeople < ActiveRecord::Migration[7.1]
  def change
    create_table :people do |t|
      t.string :gender
      t.string :first_name
      t.string :last_name
      t.datetime :birth_date
      t.string :address
      t.string :phone_number
      t.string :email
      t.references :locality, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true
      t.timestamps
    end
  end
end
