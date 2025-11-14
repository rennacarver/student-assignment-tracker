class CreateAssignments < ActiveRecord::Migration[8.1]
  def change
    create_table :assignments do |t|
      t.string :title
      t.text :description
      t.date :due_date
      t.string :status
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
