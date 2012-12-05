class Admin::SearchesController < ApplicationController
  def index
    @searchItems = Hash.new
    @sorted = []
    if person_signed_in?
      logger.debug "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
      logger.debug "current_person"
      logger.debug current_person.id
      students = current_person.students
      student_ids = students.collect{|x| x.id}
      searchLists = SearchList.where(:person_id=>student_ids)
    else
      r = Role.where(:name=>:Student).first
      studentRoles = RoleAssignment.where(:role_id=>r.id)
      students = []
      studentRoles.each do |role|
        students.append(role.person_id)
      end
      searchLists = SearchList.where(:person_id=>students)
    end

    list_ids = searchLists.collect{|x| x.id}
    items = SearchItem.where(:search_list_id=>list_ids)
    items.each do |item|
      if @searchItems[item.query]
        @searchItems[item.query] += 1
      else
        @searchItems[item.query] = 1
      end
    end

    @sorted = @searchItems.sort{|a,b| a[1]<=>b[1]}.reverse

    return @sorted
  end
end
