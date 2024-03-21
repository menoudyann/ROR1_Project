class CreateJoinTableCoursesPeople < ActiveRecord::Migration[7.1]
  def change
    create_join_table :courses, :people do |t|
      t.index [:course_id, :person_id]
      t.index [:person_id, :course_id]
      t.string :classe
    end
  end
end
