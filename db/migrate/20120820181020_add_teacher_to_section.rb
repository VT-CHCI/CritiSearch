class AddTeacherToSection < ActiveRecord::Migration
  def self.up
    change_table :sections do |t|
      t.integer :teacher_id
    end 
  end
 
  def self.down
    change_table :people do |t|
      t.remove :teacher_id
    end
  end
end
