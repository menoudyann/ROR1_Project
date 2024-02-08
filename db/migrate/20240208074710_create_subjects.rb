class CreateSubjects < ActiveRecord::Migration[7.1]
  def change
    create_table :subjects do |t|
      t.string :subject
      t.decimal :coefficient
      t.string :status

      t.timestamps
    end
  end
end
