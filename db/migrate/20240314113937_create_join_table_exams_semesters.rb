class CreateJoinTableExamsSemesters < ActiveRecord::Migration[7.1]
  def change
    create_join_table :exams, :semesters do |t|
      t.index [:exam_id, :semester_id]
      t.index [:semester_id, :exam_id]
    end
  end
end
