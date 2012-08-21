class AdminAssignmentsController < ApplicationController
  # GET /admin_assignments
  # GET /admin_assignments.json
  def index
    @admin_assignments = AdminAssignment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_assignments }
    end
  end

  # GET /admin_assignments/1
  # GET /admin_assignments/1.json
  def show
    @admin_assignment = AdminAssignment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_assignment }
    end
  end

  # GET /admin_assignments/new
  # GET /admin_assignments/new.json
  def new
    @admin_assignment = AdminAssignment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_assignment }
    end
  end

  # GET /admin_assignments/1/edit
  def edit
    @admin_assignment = AdminAssignment.find(params[:id])
  end

  # POST /admin_assignments
  # POST /admin_assignments.json
  def create
    @admin_assignment = AdminAssignment.new(params[:admin_assignment])

    respond_to do |format|
      if @admin_assignment.save
        format.html { redirect_to @admin_assignment, notice: 'Admin assignment was successfully created.' }
        format.json { render json: @admin_assignment, status: :created, location: @admin_assignment }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin_assignments/1
  # PUT /admin_assignments/1.json
  def update
    @admin_assignment = AdminAssignment.find(params[:id])

    respond_to do |format|
      if @admin_assignment.update_attributes(params[:admin_assignment])
        format.html { redirect_to @admin_assignment, notice: 'Admin assignment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_assignments/1
  # DELETE /admin_assignments/1.json
  def destroy
    @admin_assignment = AdminAssignment.find(params[:id])
    @admin_assignment.destroy

    respond_to do |format|
      format.html { redirect_to admin_assignments_url }
      format.json { head :no_content }
    end
  end
end
