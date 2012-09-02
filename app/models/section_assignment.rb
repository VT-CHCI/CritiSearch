class SectionAssignment < ActiveRecord::Base
  belongs_to :person
  belongs_to :section

  has_paper_trail
end
