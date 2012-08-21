class SectionAssignment < ActiveRecord::Base
  belongs_to :person
  belongs_to :section
end
