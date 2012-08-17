require 'gsearch-parser'

class SearchController < ApplicationController
  helper_method :countAndNext
  
  @@counter = 0

  def index
  end
 
  def countAndNext
    @@counter = @@counter + 1
    # return @counter
  end

  def result
    
    @@counter = 0

    # Extract query from GET params
    query = params[:q]

    if query.nil? or query.length < 1
      redirect_to "/"
    else

      # Initalize variables to be used by the View
      @webSearch = GSearchParser.webSearch(query)
      @nextURI = @webSearch.nextURI

      # Get the current list associated with this session
      @list = current_search_list

      # Create a new search_item attached to this list from the query
      search_item = @list.search_items.build(query: query)

      # Save to database
      search_item.save
    end
  end

  def ajax
    # Extract uri from POST param
    uri = params[:uri].strip

    # Decode the uri
    decodedURI = URI.unescape(uri).gsub(/ /, '+')

    # Parse a new search page using the uri
    @webSearch = GSearchParser.parseSearchPage(decodedURI)
    @nextURI = @webSearch.nextURI

    respond_to do |format|
      format.html { render layout: false }
    end
  end

end
