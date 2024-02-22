class CreateJoinTableSemesterExam < ActiveRecord::Migration[7.1]
  def change
    create_table :semesters_has_exams do |t|
      t.belongs_to :semester, foreign_key: true
      t.belongs_to :exam, foreign_key: true
    end
  end
end
