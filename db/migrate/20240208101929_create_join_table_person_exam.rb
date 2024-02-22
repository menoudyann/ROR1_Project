class CreateJoinTablePersonExam < ActiveRecord::Migration[7.1]
  def change
    create_table :people_has_exams do |t|
      t.belongs_to :person, foreign_key: true
      t.belongs_to :exam, foreign_key: true
      t.float :grade
    end
  end
end
