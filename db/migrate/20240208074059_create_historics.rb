class CreateHistorics < ActiveRecord::Migration[7.1]
  def change
    create_table :historics do |t|
      t.string :student_first_name
      t.string :student_last_name
      t.datetime :exam_date
      t.string :exam_title
      t.integer :grade
      t.string :semester
      t.integer :year
      t.timestamps
    end
  end
end
