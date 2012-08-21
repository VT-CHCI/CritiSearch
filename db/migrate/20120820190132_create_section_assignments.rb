class CreateSectionAssignments < ActiveRecord::Migration
  def change
    create_table :section_assignments do |t|
      t.belongs_to :person
      t.belongs_to :section

      t.timestamps
    end
    add_index :section_assignments, :person_id
    add_index :section_assignments, :section_id
  end
end
