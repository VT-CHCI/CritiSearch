class CreateCourseOfferings < ActiveRecord::Migration
  def change
    create_table :course_offerings do |t|
      t.belongs_to :course
      t.belongs_to :school

      t.timestamps
    end
    add_index :course_offerings, :course_id
    add_index :course_offerings, :school_id
  end
end
