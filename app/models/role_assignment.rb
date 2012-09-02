class RoleAssignment < ActiveRecord::Base
  belongs_to :person
  belongs_to :role

  has_paper_trail

  attr_accessible :person, :role, :role_id
end
