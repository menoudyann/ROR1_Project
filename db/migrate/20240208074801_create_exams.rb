class CreateExams < ActiveRecord::Migration[7.1]
  def change
    create_table :exams do |t|
      t.datetime :date
      t.string :title
      t.decimal :coefficient
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
