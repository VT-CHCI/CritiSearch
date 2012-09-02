class CourseOffering < ActiveRecord::Base
  belongs_to :course
  belongs_to :school

  has_paper_trail
end
