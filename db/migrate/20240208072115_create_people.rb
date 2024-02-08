class CreatePeople < ActiveRecord::Migration[7.1]
  def change
    create_table :people do |t|
      t.string :gender
      t.text :first_name
      t.text :last_name
      t.datetime :birth_date
      t.text :address
      t.string :phone_number
      t.text :email
      t.boolean :is_teacher
      t.references :locality, null: false, foreign_key: true

      t.timestamps
    end
  end
end
