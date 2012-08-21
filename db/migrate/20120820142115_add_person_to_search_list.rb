class AddPersonToSearchList < ActiveRecord::Migration
  def self.up
    change_table :search_lists do |t|
      t.belongs_to :person
    end
  end
 
  def self.down
    change_table :search_lists do |t|
      t.remove :person
    end
  end
end
