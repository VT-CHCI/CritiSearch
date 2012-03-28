class SearchItem < ActiveRecord::Base
  belongs_to :search_list;

  before_save :ensure_unique_query

  # ensure that duplicate queries are not saved
  def ensure_unique_query
    search_list.search_items.each do |item|
      if item.query == self.query
        return false
      end
    end
    return true
  end
  
end
