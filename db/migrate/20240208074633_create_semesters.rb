class CreateSemesters < ActiveRecord::Migration[7.1]
  def change
    create_table :semesters do |t|
      t.integer :number
      t.string :years

      t.timestamps
    end
  end
end
