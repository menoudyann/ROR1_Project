class CreateLocalities < ActiveRecord::Migration[7.1]
  def change
    create_table :localities do |t|
      t.string :ZIP, null: false, limit: 45
      t.string :locality, null: false, limit: 255
      t.timestamps
    end
  end
end
