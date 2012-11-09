class VennController < ApplicationController
  def show
    #get the person
    #current_person

    #get the search list for this query
    # s = SearchList.where(:person_id=>current_person.id)
    # search_ids = s.collect{|x| x.id}
    # #get the items for the list
    # items = SearchItem.where(:search_list_id => search_ids, :query=>params[:query])
    # item_ids = items.collect{|x| x.id}

    #get the ratings for the items
    # @ratings = Rating.where(:search_item_id=>item_ids) 
    @ups = []
    @downs = []
    if person_signed_in?
      @ratings = current_person.vennRatings(params[:query])
      @ups = @ratings["up"]
      @downs = @ratings["down"]
    end
    
    # @meeting_time = MeetingTime.find(params[:id])

    respond_to do |format|
      format.html { render action: "show" }
      # format.json { render json: @meeting_time }
    end
  end

  def index
    # @search_list = SearchList.where(:person_id=>current_person.id).order("created_at").last
    #@search_items = SearchItem.select(:query).uniq

    search_lists = SearchList.where(:person_id=>current_person)
    list_ids = search_lists.collect{|x| x.id}
    @search_items = SearchItem.where(:search_list_id=>list_ids).uniq_by {|item| item.query}

    sendLog([{
      "logType_id"=> 3, 
      "details"=>"Viewed Venn List"
    }])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @search_items }
    end
  end
end