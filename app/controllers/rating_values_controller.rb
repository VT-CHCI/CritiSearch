class RatingValuesController < ApplicationController
  # GET /rating_values
  # GET /rating_values.json
  def index
    @rating_values = RatingValue.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rating_values }
    end
  end

  # GET /rating_values/1
  # GET /rating_values/1.json
  def show
    @rating_value = RatingValue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rating_value }
    end
  end

  # GET /rating_values/new
  # GET /rating_values/new.json
  def new
    @rating_value = RatingValue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rating_value }
    end
  end

  # GET /rating_values/1/edit
  def edit
    @rating_value = RatingValue.find(params[:id])
  end

  # POST /rating_values
  # POST /rating_values.json
  def create
    @rating_value = RatingValue.new(params[:rating_value])

    respond_to do |format|
      if @rating_value.save
        format.html { redirect_to @rating_value, notice: 'Rating value was successfully created.' }
        format.json { render json: @rating_value, status: :created, location: @rating_value }
      else
        format.html { render action: "new" }
        format.json { render json: @rating_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rating_values/1
  # PUT /rating_values/1.json
  def update
    @rating_value = RatingValue.find(params[:id])

    respond_to do |format|
      if @rating_value.update_attributes(params[:rating_value])
        format.html { redirect_to @rating_value, notice: 'Rating value was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rating_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rating_values/1
  # DELETE /rating_values/1.json
  def destroy
    @rating_value = RatingValue.find(params[:id])
    @rating_value.destroy

    respond_to do |format|
      format.html { redirect_to rating_values_url }
      format.json { head :no_content }
    end
  end
end
