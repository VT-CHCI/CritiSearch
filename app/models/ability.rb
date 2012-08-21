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
      can :manage, School do |school|
        person.school? school.name
      end

      can :manage, Section do |section|
        person.school? section.school
      end

      can :manage, SectionAssignment do |section_assignment|
        person.school? section_assignment.school
      end

      can :manage, CourseOffering do |course_offering|
        person.school? course_offering.school
      end

      can :manage, Course do |course|
        course.no_school? || match_in_lists?(course.schools, person.schools)
      end

      can :manage, MeetingTime do |meeting_time|
        person.school? meeting_time.section.school.name
      end


    elsif person.role? :teacher
      can :read, [Product, Asset]
      # manage products, assets he owns
      can :manage, Product do |product|
        product.try(:owner) == person
      end
      can :manage, Asset do |asset|
        asset.assetable.try(:owner) == person
      end

    elsif person.role? :student
    end
  end

  def match_in_lists? (l1, l2)
    (l1 & l2).length > 0
  end
end
