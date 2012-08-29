class Role < ActiveRecord::Base
  has_many :role_assignments
	has_many :people, :through => :role_assignments

  attr_accessible :people, :role_id
end
