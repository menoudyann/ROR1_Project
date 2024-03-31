class CreateSemesters < ActiveRecord::Migration[7.1]
  def change
    create_table :semesters do |t|
      t.integer :number, null: false
      t.string :years, null: false, limit: 45

      # The combination of the number and years must be unique
      t.index [:number, :years], unique: true
      t.timestamps
    end
  end
end
