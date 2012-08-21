class AddNameToMeetingTime < ActiveRecord::Migration
  def self.up
    change_table :meeting_times do |t|
      t.string :name
    end 
  end
 
  def self.down
    change_table :meeting_times do |t|
      t.remove :name
    end
  end
end
