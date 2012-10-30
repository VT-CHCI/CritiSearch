class ReflectionServiceController < ActionController::Base
  def create
    lists = SearchList.where(:person_id=>params[:person])
    list_ids = lists.collect{|x| x.id}

    r = Reflection.new
    r.reflection = params[:reflection]
    r.search_item = SearchItem.joins(:search_list).where(:query=>params[:query], :search_list_id=>list_ids).order("created_at DESC").first
    r.save
    head :created
  end
end