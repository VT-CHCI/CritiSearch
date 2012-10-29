class FollowServiceController < ActionController::Base
  
  # this is the service to create the follows in the db
  def create
    url = params[:url]
    person = params[:person]
    query = params[:query]

    if person.length > 0

      logger.debug "\n\n\n\n\n\n\n\n\n\n\n should have created \n\n\n\n\n\n\n\n\n\n\n"

      searches = SearchList.where(:person_id => person)
      search_ids = searches.collect{|x| x.id}

      items = SearchItem.where(:search_list_id => search_ids, :query => query)
      item_id = items.collect{|x| x.id}.first

      f = Follow.new
      f.url = url
      f.search_item_id = item_id
      f.save

    end

    head :created

  end

end