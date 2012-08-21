class AddUnknownDetailsandSuspectedPersonToPerson < ActiveRecord::Migration
  def self.up
    change_table :people do |t|
      t.text :details
      t.belongs_to :suspected_person
    end
  end
 
  def self.down
    change_table :people do |t|
      t.remove :suspected_person
      t.remove :details
    end
  end
end
