class AddFirstNameToPerson < ActiveRecord::Migration
  def self.up
    change_table :people do |t|
      t.string :first_name
    end 
  end
 
  def self.down
    change_table :people do |t|
      t.remove :first_name
    end
  end
end
