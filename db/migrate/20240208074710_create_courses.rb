class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.string :name, null: false, limit: 255
      t.boolean :is_archived, default: false, null: false
      t.timestamps
    end
  end
end
