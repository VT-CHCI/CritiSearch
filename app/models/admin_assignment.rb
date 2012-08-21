class AdminAssignment < ActiveRecord::Base
  belongs_to :person
  belongs_to :school
end
