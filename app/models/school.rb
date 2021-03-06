class School < ActiveRecord::Base
  has_many :admin_assignments
  has_many :people, :through => :admin_assignments
  has_many :course_offerings
  has_many :courses, :through => :course_offerings
  has_many :sections

  validates :name, :presence => true
  validates :time_zone, :presence => true

  has_paper_trail
end
