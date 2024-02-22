class CreateJoinTablePersonSubject < ActiveRecord::Migration[7.1]
  def change
    create_table :people_has_subjects do |t|
      t.belongs_to :person, foreign_key: true
      t.belongs_to :subject, foreign_key: true
      t.string :classe, null: false
    end
  end
end
