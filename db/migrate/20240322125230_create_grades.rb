class CreateGrades < ActiveRecord::Migration[7.1]
  def change
    create_table :grades do |t|
      t.references :person, null: false, foreign_key: true
      t.references :exam, null: false, foreign_key: true
      t.decimal :grade, precision: 3, scale: 2, null: false

      # Bearing in mind that the exam is linked to a semester
      # in a given school year, the student could therefore get
      # the same mark twice in the same exam in a different year.
      t.index [:person_id, :exam_id], unique: true
    end
  end
end
