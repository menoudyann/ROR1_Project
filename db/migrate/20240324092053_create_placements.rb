class CreatePlacements < ActiveRecord::Migration[7.1]
  def change
    create_table :placements do |t|
      t.references :person, null: false, foreign_key: true
      t.references :classroom, null: false, foreign_key: true
      t.timestamps
    end
  end
end
