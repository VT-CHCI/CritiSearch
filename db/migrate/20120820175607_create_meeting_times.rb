class CreateMeetingTimes < ActiveRecord::Migration
  def change
    create_table :meeting_times do |t|
      t.string :description
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday
      t.string :period
      t.time :startTime
      t.time :endTime
      t.belongs_to :section
      t.date :startDate
      t.date :endDate

      t.timestamps
    end
    add_index :meeting_times, :section_id
  end
end
