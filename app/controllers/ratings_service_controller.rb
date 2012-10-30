class RatingsServiceController < ActionController::Base

  # this is the service to create or modify the rating in the db
	def rate
		logger.debug "logger.debug"
		# puts "puts"

    #get the url, person, query, and ratingVlue from the request
    url = params[:url]
    person = params[:person]
    query = params[:query]
    resultContent = params[:resultContent].gsub(/"/, '\\"')

    logger.debug "result_content"
    logger.debug resultContent

    if params[:ratingValue]
      ratingValue = params[:ratingValue]
      #find the ratingValue in the database
      rv = RatingValue.where(:name=>ratingValue).first
    end

    

    # if there is no person on this request, don't do any work
    if person.length > 0
      logger.debug "got inside person.length check"
      r = Rating.new
      r.url = url
      p = Person.find(person)
      
      sql = "
        select search_items.query as query, search_items.id as search_item_id, 
        search_lists.person_id as person_id, ratings.id as id
        from search_lists
        join search_items on search_items.search_list_id = search_lists.id
        join ratings on ratings.search_item_id = search_items.id  
        join rating_values on rating_values.id = ratings.rating_value_id
        where search_lists.person_id = #{p.id} and search_items.query = '#{query}' and ratings.url='#{url}'
      "
      results = ActiveRecord::Base.connection.execute(sql)
      if results.first
        logger.debug "got some results"
        r = results.first
        rating = Rating.find(results.first['id'])
        if params[:deletion]
          rating.delete
        else
          rating.rating_value_id = rv.id
          rating.result_content = resultContent
          rating.save
        end
      else
        logger.debug "had no results, make a new one"
        searchItemQuery = 
        "select search_items.id as si, search_items.query as query
          from search_items 
          join search_lists on search_lists.id = search_items.search_list_id
          where search_lists.person_id = #{p.id} and search_items.query='#{query}'"

        searchItems = ActiveRecord::Base.connection.execute(searchItemQuery)
        if searchItems.first
          logger.debug "found the searchItems"
          newRating = Rating.new
          newRating.search_item_id=searchItems.first['si']
          newRating.url = url
          newRating.rating_value_id = rv.id
          newRating.result_content = resultContent
          newRating.save
        end
      end
      # SearchItem.where(:query=>query).joins(:search_list).joins(:person).where(:person_id=>p.id)
      # SearchList.joins(:search_items, :person).where(:query=>"michael")
      logger.debug "person |#{person}|"
    end
    head :created
  end
end