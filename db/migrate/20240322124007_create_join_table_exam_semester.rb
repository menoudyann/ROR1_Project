class CreateJoinTableExamSemester < ActiveRecord::Migration[7.1]
  def change
    create_join_table :exams, :semesters do |t|
    end
  end
end
