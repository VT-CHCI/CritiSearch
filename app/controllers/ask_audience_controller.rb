class AskAudienceController < ApplicationController
  def show
    #get the person
    #current_person

    # #get their section
    # s = SectionAssignment.where(:person_id=>current_person.id).first
    # assignments = SectionAssignment.where(:section_id => s.section_id)

    # #get classmates
    # classmates = assignments.collect{|x| x.person_id}

    # get all the other people's ratings
    # searches = SearchList.where(:person_id=>current_person.classmates)
    # search_ids = searches.collect{|x| x.id}
    # items = SearchItem.where(:search_list_id => search_ids, :query=>params[:query])
    # item_ids = items.collect{|x| x.id}
    # ratings = Rating.where(:search_item_id=>item_ids) 

    # @ratings_by_url = {}
    # ratings.each do |r|
    #   if @ratings_by_url[r.url].nil?

    #   else
    #   end
    # end

    # @meeting_time = MeetingTime.find(params[:id])

    @ratings = current_person.audienceRatings(params[:query])

    respond_to do |format|
      format.html { render action: "show" }
      format.json { render json: @ratings }
    end
  end

  def index
    @search_items = SearchItem.select(:query).uniq
    @ratings = current_person.audienceForAllQueries

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @search_items }
    end
  end
end