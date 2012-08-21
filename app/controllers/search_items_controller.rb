class SearchItemsController < ApplicationController
  # GET /search_items
  # GET /search_items.json
  def index
    @search_items = SearchItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @search_items }
    end
  end

  # GET /search_items/1
  # GET /search_items/1.json
  def show
    @search_item = SearchItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @search_item }
    end
  end

  # GET /search_items/new
  # GET /search_items/new.json
  def new
    @search_item = SearchItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @search_item }
    end
  end

  # GET /search_items/1/edit
  def edit
    @search_item = SearchItem.find(params[:id])
  end

  # POST /search_items
  # POST /search_items.json
  def create
    @list = current_search_list
    @search_item = @list.search_items.build(params[:search_item])

    if person_signed_in?
      @search_item.person = current_person
    else
      @search_item.person = current_person_guess
    end

    respond_to do |format|
      if @search_item.save
        format.html { redirect_to @search_item }
        format.json { render json: @search_item, status: :created, location: @search_item }
      else
        format.html { render action: "new" }
        format.json { render json: @search_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /search_items/1
  # PUT /search_items/1.json
  def update
    @search_item = SearchItem.find(params[:id])

    respond_to do |format|
      if @search_item.update_attributes(params[:search_item])
        format.html { redirect_to @search_item, notice: 'Search item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @search_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /search_items/1
  # DELETE /search_items/1.json
  def destroy
    @search_item = SearchItem.find(params[:id])
    @search_item.destroy

    respond_to do |format|
      format.html { redirect_to search_items_url }
      format.json { head :no_content }
    end
  end
end
