class MeetingTimesController < ApplicationController
  # GET /meeting_times
  # GET /meeting_times.json
  def index
    @meeting_times = MeetingTime.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @meeting_times }
    end
  end

  # GET /meeting_times/1
  # GET /meeting_times/1.json
  def show
    @meeting_time = MeetingTime.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @meeting_time }
    end
  end

  # GET /meeting_times/new
  # GET /meeting_times/new.json
  def new
    @meeting_time = MeetingTime.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @meeting_time }
    end
  end

  # GET /meeting_times/1/edit
  def edit
    @meeting_time = MeetingTime.find(params[:id])
  end

  # POST /meeting_times
  # POST /meeting_times.json
  def create
    @meeting_time = MeetingTime.new(params[:meeting_time])

    respond_to do |format|
      if @meeting_time.save
        format.html { redirect_to @meeting_time, notice: 'Meeting time was successfully created.' }
        format.json { render json: @meeting_time, status: :created, location: @meeting_time }
      else
        format.html { render action: "new" }
        format.json { render json: @meeting_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /meeting_times/1
  # PUT /meeting_times/1.json
  def update
    @meeting_time = MeetingTime.find(params[:id])

    respond_to do |format|
      if @meeting_time.update_attributes(params[:meeting_time])
        format.html { redirect_to @meeting_time, notice: 'Meeting time was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @meeting_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meeting_times/1
  # DELETE /meeting_times/1.json
  def destroy
    @meeting_time = MeetingTime.find(params[:id])
    @meeting_time.destroy

    respond_to do |format|
      format.html { redirect_to meeting_times_url }
      format.json { head :no_content }
    end
  end

  before_filter :set_school_time_zone
  
  private
  
  def set_school_time_zone
    Time.zone = @meeting_time.section.school.time_zone
  end
end
