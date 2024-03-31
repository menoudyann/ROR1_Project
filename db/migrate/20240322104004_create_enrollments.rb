class CreateEnrollments < ActiveRecord::Migration[7.1]
  def change
    create_table :enrollments do |t|
      t.references :classroom, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
    end
  end
end
