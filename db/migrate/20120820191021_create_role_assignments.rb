class CreateRoleAssignments < ActiveRecord::Migration
  def change
    create_table :role_assignments do |t|
      t.belongs_to :person
      t.belongs_to :role

      t.timestamps
    end
    add_index :role_assignments, :person_id
    add_index :role_assignments, :role_id
  end
end
