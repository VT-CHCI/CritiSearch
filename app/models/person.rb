class Person < ActiveRecord::Base
  has_many :role_assignments, :dependent => :destroy
	has_many :roles, :through => :role_assignments
  has_many :section_assignments, :dependent => :destroy
  has_many :sections, :through => :section_assignments
  has_many :admin_assignments, :dependent => :destroy
  has_many :schools, :through => :admin_assignments
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :validatable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :authentication_keys => [:id_number]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :id_number, :first_name

  belongs_to :suspected_person, :class_name => "Person"


  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
	end

  def school?(school)
    return !!self.schools.find_by_name(school)
  end

  def email_required?
    false
  end

  def sections
    if self.role? :super_admin
      Section.all
    elsif self.role? :school_admin
      Section.where(:school_id => current_person.schools)
    elsif self.role? :teacher
      Section.where(:teacher_id => self.id)
    else
      []
    end
  end
end
