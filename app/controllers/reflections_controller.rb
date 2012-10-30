class ReflectionsController < ApplicationController
  # GET /reflections
  # GET /reflections.json
  def index
    @reflections = Reflection.all

    respond_to do |format|
      format.html # index.html.erb
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
