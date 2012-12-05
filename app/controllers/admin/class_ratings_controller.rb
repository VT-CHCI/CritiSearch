class Admin::ClassRatingsController < ApplicationController
  def show
    logger.debug "\n\n\n\n\n\n\n\n\n\n\n\n\n\n" 
    logger.debug params
    logger.debug params["id"] #incoming ID is now for a RATING
    rating = Rating.find(params["id"])
    @url = rating.url
    @query = rating.search_item.query

    upRatings = Rating.where(:url=>@url, :rating_value_id=>RatingValue.where(:name=>"up").first.id)
    downRatings = Rating.where(:url=>@url, :rating_value_id=>RatingValue.where(:name=>"down").first.id)
    
    @ups = []
    upRatings.each do |up|
      @ups.append(up.search_item.search_list.person.first_name)
    end

    @downs = []

    downRatings.each do |down|
      @downs.append(down.search_item.search_list.person.first_name)
    end

  end
end
