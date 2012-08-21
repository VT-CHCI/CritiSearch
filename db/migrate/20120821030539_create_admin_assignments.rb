class CreateAdminAssignments < ActiveRecord::Migration
  def change
    create_table :admin_assignments do |t|
      t.belongs_to :person
      t.belongs_to :school

      t.timestamps
    end
    add_index :admin_assignments, :person_id
    add_index :admin_assignments, :school_id
  end
end
