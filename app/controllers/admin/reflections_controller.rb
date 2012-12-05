class Admin::ReflectionsController < ApplicationController
#   # GET /admin/reflections
#   # GET /admin/reflections.json
  def index
    # logger.debug "\n\n\n\n\n\n\n\n\n\n\n\noh my"
    @reflectionPairs = []
    
    @reflections = Reflection.find(:all, :include=>:search_item)
    # logger.debug "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\ngot all"
    # logger.debug @reflections[0].search_item.query

    if person_signed_in? && current_person.role?(:teacher)
      students = current_person.students
      student_ids = students.collect{|p| p.id}
      searches = SearchList.where(:person_id=>student_ids)
      search_ids = searches.collect{|s| s.id}
      search_items = SearchItem.where(:search_list_id => search_ids)
      si_ids = search_items.collect { |si| si.id }
      @reflections = Reflection.where(:search_item_id =>si_ids).includes(:search_item)
      # logger.debug "exiting if"
      # logger.debug @reflections[0].search_item.query
    end

    @reflections.each do |reflection|
      logger.debug reflection
      @reflectionPairs.push([reflection.search_item.query, reflection, reflection.search_item.search_list.person.first_name])
    end
    # debugger
    logger.debug "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    # puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reflectionPairs }
    end
  end
end
