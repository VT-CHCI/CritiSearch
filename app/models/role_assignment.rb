class RoleAssignment < ActiveRecord::Base
  belongs_to :person
  belongs_to :role

  attr_accessible :person, :role, :role_id
end
