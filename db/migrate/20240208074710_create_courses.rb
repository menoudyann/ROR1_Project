class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.boolean :is_archived, default: false
      t.timestamps
    end
  end
end
