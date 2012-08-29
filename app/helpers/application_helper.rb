module ApplicationHelper

  # helper function that determines which div tag to wrap
  # the search bar that shows up on every page with.
  def search_bar_location
    div_class = 'top-search-bar'
    if current_page?('/') 
      div_class = 'index-page-search-bar'
    end
    div_class     
  end
 
  # helper function that returns true if currently viewing the homepage
  def on_home_page
    if current_page?('/')
      return true
    end
    return false
  end

  def on_results_page
    return current_page?("search")
  end
end
