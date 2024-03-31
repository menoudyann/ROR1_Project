class CreateExams < ActiveRecord::Migration[7.1]
  def change
    create_table :exams do |t|
      t.datetime :date, null: false
      t.string :title, null: false, limit: 100
      t.decimal :coefficient, null: false
      t.references :course, null: false, foreign_key: { on_delete: :cascade }
      t.references :semester, null: false, foreign_key: true
      t.timestamps
    end
  end
end
