class MeetingTime < ActiveRecord::Base
  belongs_to :section

  has_paper_trail

  def all_days
    return {
      "monday" => self.monday, 
      "tuesday" => self.tuesday, 
      "wednesday" => self.wednesday, 
      "thursday" => self.thursday, 
      "friday" => self.friday, 
      "saturday" => self.saturday, 
      "sunday" => self.sunday
    }
  end

  def days_held
    days = []
    self.all_days.each { |dayname, dayval| days << dayname if dayval}
    return days
  end
end
