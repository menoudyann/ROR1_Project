class CreateLocalities < ActiveRecord::Migration[7.1]
  def change
    create_table :localities do |t|
      t.string :ZIP
      t.string :locality
      t.timestamps
    end
  end
end
