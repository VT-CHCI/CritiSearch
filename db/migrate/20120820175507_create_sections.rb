class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.belongs_to :course
      t.belongs_to :school

      t.timestamps
    end
    add_index :sections, :course_id
    add_index :sections, :school_id
  end
end
