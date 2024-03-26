class CreateExams < ActiveRecord::Migration[7.1]
  def change
    create_table :exams do |t|
      t.datetime :date
      t.string :title
      t.decimal :coefficient
      t.references :course, null: false, foreign_key: { on_delete: :cascade }
      t.timestamps
    end
  end
end
