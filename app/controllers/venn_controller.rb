class VennController < ApplicationController
  def show
    #get the person
    #current_person

    #get the search list for this query
    s = SearchList.where(:query=>params[:query], :person_id=>current_person.id)
    search_ids = s.collect{|x| x.id}
    #get the items for the list
    items = SearchItem.where(:search_list_id => search_ids, :query=>params[:query])
    item_ids = items.collect{|x| x.id}

    #get the ratings for the items
    @ratings = Rating.where(:search_item_id=>item_ids) 
    
    # @meeting_time = MeetingTime.find(params[:id])

    respond_to do |format|
      format.html { render action: "show" }
      # format.json { render json: @meeting_time }
    end
  end
end