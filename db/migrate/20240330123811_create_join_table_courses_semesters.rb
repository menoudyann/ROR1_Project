class CreateJoinTableCoursesSemesters < ActiveRecord::Migration[7.1]
  def change
    create_join_table :courses, :semesters do |t|
    end
  end
end
