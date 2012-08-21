class AddNameToSections < ActiveRecord::Migration
  def self.up
    change_table :sections do |t|
      t.string :name
    end 
  end
 
  def self.down
    change_table :sections do |t|
      t.remove :name
    end
  end
end
