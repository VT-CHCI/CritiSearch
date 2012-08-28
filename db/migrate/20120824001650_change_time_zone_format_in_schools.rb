class ChangeTimeZoneFormatInSchools < ActiveRecord::Migration
  def self.up
   change_column :schools, :time_zone, :string
  end

  def self.down
   change_column :schools, :time_zone, :datetime
  end

end
