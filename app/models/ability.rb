class Ability
  include CanCan::Ability

  def initialize(person)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities

    person ||= Person.new # guest user
 
    if person.role? :super_admin
      can :manage, :all

    elsif person.role? :school_admin

      # course
      # everything

      # meeting time
      # create
      # only modify the ones for their school?

      # person
      # create
      # only modify the ones for their school?

      # course offering
      # only the ones for their school?

      # school
      # create
      # edit those for which they're admin

      # admin assignment
      # only themselves

      # search item
      # search list
      # only those related to their schools

      # section
      # those for their schools

      # section assignment
      # those for their schools

      # role
      # no access?

      # role assignment
      # change only teachers and students?

      can :create, School
      can :manage, School do |school|
        person.school? school.name
      end

      can :manage, Section do |section|
        person.school? section.school
      end

      can :manage, SectionAssignment do |section_assignment|
        person.school? section_assignment.school
      end

      can :create, CourseOffering
      can :manage, CourseOffering do |course_offering|
        person.school? course_offering.school
      end

      can :manage, Course

      can :manage, MeetingTime do |meeting_time|
        person.school? meeting_time.section.school.name
      end

      can :create, Person
      can :manage, Person do |p|
        if p.role? :teacher || p.role? :student
          true
        else
          false
        end
      end

      can :manage, SearchItem do |search_item|
        can? :manage, search_item.search_list
      end

      can :manage, SearchList do |search_list|
        can? :manage, search_list.person
      end

      can :manage, RoleAssignment do |role_assignment|
        can? :manage, role_assignment.person
      end


    elsif person.role? :teacher
      
      can :create, Person
      can :manage, Person do |p|
        p.role? :student || p == person
      end

      can :create, SectionAssignment
      can :manage, SectionAssignment do |section_assignment|
        section_assignment.section.teacher == person
      end

      can :manage, SearchItem do |search_item|
        can? :manage, search_item.search_list
      end

      can :manage, SearchList do |search_list|
        can? :manage, search_list.person
      end


    #elsif person.role? :student
      #
    end
  end

  def match_in_lists? (l1, l2)
    (l1 & l2).length > 0
  end
end
