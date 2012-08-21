class Section < ActiveRecord::Base
  belongs_to :course
  belongs_to :school
  belongs_to :teacher, :class_name => "Person"
  has_many :section_assignments
  has_many :students, :class_name => "Person", :through => :section_assignments
end
