class ApplicationController < ActionController::Base
  protect_from_forgery

  require 'HTTParty'

  def sendLog (data)
    HTTParty.post('http://localhost:3000/interaction_logs/service', :body=>{:logs=>{"0"=>{:logType_id=>data["logType_id"], :details=>data["details"]}}, :application=>"CritiSearch"})
  rescue Errno::ECONNREFUSED
    logger.debug "could not reach ixn_log"
  end 

  private

    # Function that returns the search_list associated with
    # the current session
    def current_search_list
      logger.debug "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
      logger.debug "current_search_list"
      s = SearchList.find(session[:search_list_id])
      if person_signed_in?
        s.person = current_person
        logger.debug current_person
        logger.debug s.person
        logger.debug "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
      end
      s
    rescue ActiveRecord::RecordNotFound
      logger.debug "rescue"
      list = SearchList.create
      session[:search_list_id] = list.id
      if person_signed_in?
        logger.debug "added person"  
        list.person = current_person
        list.save
        logger.debug list.person
      end
      logger.debug "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
      list
    end
end
