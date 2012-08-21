class SectionAssignmentsController < ApplicationController
  # GET /section_assignments
  # GET /section_assignments.json
  def index
    @section_assignments = SectionAssignment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @section_assignments }
    end
  end

  # GET /section_assignments/1
  # GET /section_assignments/1.json
  def show
    @section_assignment = SectionAssignment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @section_assignment }
    end
  end

  # GET /section_assignments/new
  # GET /section_assignments/new.json
  def new
    @section_assignment = SectionAssignment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @section_assignment }
    end
  end

  # GET /section_assignments/1/edit
  def edit
    @section_assignment = SectionAssignment.find(params[:id])
  end

  # POST /section_assignments
  # POST /section_assignments.json
  def create
    @section_assignment = SectionAssignment.new(params[:section_assignment])

    respond_to do |format|
      if @section_assignment.save
        format.html { redirect_to @section_assignment, notice: 'Section assignment was successfully created.' }
        format.json { render json: @section_assignment, status: :created, location: @section_assignment }
      else
        format.html { render action: "new" }
        format.json { render json: @section_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /section_assignments/1
  # PUT /section_assignments/1.json
  def update
    @section_assignment = SectionAssignment.find(params[:id])

    respond_to do |format|
      if @section_assignment.update_attributes(params[:section_assignment])
        format.html { redirect_to @section_assignment, notice: 'Section assignment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @section_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /section_assignments/1
  # DELETE /section_assignments/1.json
  def destroy
    @section_assignment = SectionAssignment.find(params[:id])
    @section_assignment.destroy

    respond_to do |format|
      format.html { redirect_to section_assignments_url }
      format.json { head :no_content }
    end
  end
end
