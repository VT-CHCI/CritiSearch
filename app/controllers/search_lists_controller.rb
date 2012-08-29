class SearchListsController < ApplicationController
  # GET /search_lists
  # GET /search_lists.json
  def index
    @search_lists = SearchList.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @search_lists }
    end
  end

  # GET /search_lists/1
  # GET /search_lists/1.json
  def show
    @search_list = SearchList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @search_list }
    end
  end

  # GET /search_lists/new
  # GET /search_lists/new.json
  def new
    @search_list = SearchList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @search_list }
    end
  end

  # GET /search_lists/1/edit
  def edit
    @search_list = SearchList.find(params[:id])
  end

  # POST /search_lists
  # POST /search_lists.json
  def create
    @search_list = SearchList.new(params[:search_list])

    if person_signed_in?
      logger.debug "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
      logger.debug "search_list_controller#create"
      @search_list.person = current_person
      logger.debug "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    end

    respond_to do |format|
      if @search_list.save
        format.html { redirect_to @search_list, notice: 'Search list was successfully created.' }
        format.json { render json: @search_list, status: :created, location: @search_list }
      else
        format.html { render action: "new" }
        format.json { render json: @search_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /search_lists/1
  # PUT /search_lists/1.json
  def update
    @search_list = SearchList.find(params[:id])

    respond_to do |format|
      if @search_list.update_attributes(params[:search_list])
        format.html { redirect_to @search_list, notice: 'Search list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @search_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /search_lists/1
  # DELETE /search_lists/1.json
  def destroy
    @search_list = SearchList.find(params[:id])
    @search_list.destroy

    respond_to do |format|
      format.html { redirect_to search_lists_url }
      format.json { head :no_content }
    end
  end
end
