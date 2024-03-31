class CreateClassrooms < ActiveRecord::Migration[7.1]
  def change
    create_table :classrooms do |t|
      t.date :promotion_start_date, null: false
      t.date :promotion_end_date, null: false
      t.string :name, null: false, limit: 45
      t.timestamps
    end
  end
end
