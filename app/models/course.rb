class Course < ActiveRecord::Base
  has_many :course_offerings
  has_many :sections
  has_many :schools, :through => :course_offerings

  def school?(school)
    return !!self.schools.find_by_name(school)
  end

  def no_school?
    CourseOffering.where(:course_id=>c.id).length == 0
  end
end
