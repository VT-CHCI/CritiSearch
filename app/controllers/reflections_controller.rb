class ReflectionsController < ApplicationController
  # GET /reflections
  # GET /reflections.json
  def index
    @reflections = Reflection.all

    # @reflectionPairs = []
    # Rails.logger.level = 0
    # @reflections = Reflection.find(:all, :include=>:search_item)
    # logger.debug "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\ngot all"
    # logger.debug @reflections[0].search_item.query

    # if person_signed_in? && current_person.role?(:teacher)
    #   # get the section this person teaches
    #   s = Section.where(:teacher_id=>current_person.id)
    #   studentAssignments = SectionAssignment.where(:section_id=>s.id)
    #   sa_ids = studentAssignments.collect {|x| x.person_id}
    #   students = Person.where(:id=>sa_ids)
    #   student_ids = students.collect{|p| p.id}
    #   searches = SearchList.where(:person_id=>student_ids)
    #   search_ids = searches.collect{|s| s.id}
    #   search_items = SearchItem.where(:search_list_id => search_ids)
    #   si_ids = search_items.collect { |si| si.id }
    #   @reflections = Reflection.where(:search_item_id =>si_ids).includes(:search_item)
    #   logger.debug "exiting if"
    #   logger.debug @reflections[0].search_item.query
    # end

    # @reflections.each do |reflection|
    #   @reflectionPairs.push([reflection.search_item.query, reflection, reflection.search_item.search_list.person.first_name])
    # end
    # debugger
    # logger.debug "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    # puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"

    respond_to do |format|
      format.html # index.html.erb
      # format.json { render json: @reflectionPairs }
      format.json { render json: @reflections }
    end
  end

  # GET /reflections/1
  # GET /reflections/1.json
  def show
    @reflection = Reflection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reflection }
    end
  end

  # GET /reflections/new
  # GET /reflections/new.json
  def new
    @reflection = Reflection.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reflection }
    end
  end

  # GET /reflections/1/edit
  def edit
    @reflection = Reflection.find(params[:id])
  end

  # POST /reflections
  # POST /reflections.json
  def create
    @reflection = Reflection.new(params[:reflection])

    respond_to do |format|
      if @reflection.save
        format.html { redirect_to @reflection, notice: 'Reflection was successfully created.' }
        format.json { render json: @reflection, status: :created, location: @reflection }
      else
        format.html { render action: "new" }
        format.json { render json: @reflection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reflections/1
  # PUT /reflections/1.json
  def update
    @reflection = Reflection.find(params[:id])

    respond_to do |format|
      if @reflection.update_attributes(params[:reflection])
        format.html { redirect_to @reflection, notice: 'Reflection was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reflection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reflections/1
  # DELETE /reflections/1.json
  def destroy
    @reflection = Reflection.find(params[:id])
    @reflection.destroy

    respond_to do |format|
      format.html { redirect_to reflections_url }
      format.json { head :no_content }
    end
  end
end
