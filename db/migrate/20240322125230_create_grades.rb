class CreateGrades < ActiveRecord::Migration[7.1]
  def change
    create_table :grades do |t|
      t.references :person, null: false, foreign_key: true
      t.references :exam, null: false, foreign_key: true
      t.decimal :grade
    end
  end
end
