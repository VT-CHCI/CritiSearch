class Section < ActiveRecord::Base
  belongs_to :course
  belongs_to :school
  belongs_to :teacher, :class_name => "Person"
  has_many :section_assignments
  has_many :students, :class_name => "Person", :through => :section_assignments
  has_many :meeting_times, :dependent => :destroy
  accepts_nested_attributes_for :meeting_times

  validates :course, :presence => true
  validates :school, :presence => true

  def summary
    return ((self.course && self.course.name) || "<CourseName>") + " at " + ((self.school && self.school.name) || "<SchoolName>") + " by " + ((self.teacher && self.teacher.name) || "<TeacherName>")
  end

end
