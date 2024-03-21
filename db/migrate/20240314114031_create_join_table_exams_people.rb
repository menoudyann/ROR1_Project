class CreateJoinTableExamsPeople < ActiveRecord::Migration[7.1]
  def change
    create_join_table :exams, :people do |t|
      t.index [:exam_id, :person_id]
      t.index [:person_id, :exam_id]
      t.decimal :grade
    end
  end
end
