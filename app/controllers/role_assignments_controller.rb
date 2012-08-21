class RoleAssignmentsController < ApplicationController
  # GET /role_assignments
  # GET /role_assignments.json
  def index
    @role_assignments = RoleAssignment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @role_assignments }
    end
  end

  # GET /role_assignments/1
  # GET /role_assignments/1.json
  def show
    @role_assignment = RoleAssignment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @role_assignment }
    end
  end

  # GET /role_assignments/new
  # GET /role_assignments/new.json
  def new
    @role_assignment = RoleAssignment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @role_assignment }
    end
  end

  # GET /role_assignments/1/edit
  def edit
    @role_assignment = RoleAssignment.find(params[:id])
  end

  # POST /role_assignments
  # POST /role_assignments.json
  def create
    @role_assignment = RoleAssignment.new(params[:role_assignment])

    respond_to do |format|
      if @role_assignment.save
        format.html { redirect_to @role_assignment, notice: 'Role assignment was successfully created.' }
        format.json { render json: @role_assignment, status: :created, location: @role_assignment }
      else
        format.html { render action: "new" }
        format.json { render json: @role_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /role_assignments/1
  # PUT /role_assignments/1.json
  def update
    @role_assignment = RoleAssignment.find(params[:id])

    respond_to do |format|
      if @role_assignment.update_attributes(params[:role_assignment])
        format.html { redirect_to @role_assignment, notice: 'Role assignment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @role_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /role_assignments/1
  # DELETE /role_assignments/1.json
  def destroy
    @role_assignment = RoleAssignment.find(params[:id])
    @role_assignment.destroy

    respond_to do |format|
      format.html { redirect_to role_assignments_url }
      format.json { head :no_content }
    end
  end
end
