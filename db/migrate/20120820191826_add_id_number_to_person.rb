class AddIdNumberToPerson < ActiveRecord::Migration
  def self.up
    change_table :people do |t|
      t.string :id_number
    end 
  end
 
  def self.down
    change_table :people do |t|
      t.remove :id_number
    end
  end
end
