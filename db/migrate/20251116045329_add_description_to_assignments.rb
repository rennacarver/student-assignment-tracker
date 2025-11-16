class AddDescriptionToAssignments < ActiveRecord::Migration[8.1]
  def change
    add_column :assignments, :description, :text
  end
end
