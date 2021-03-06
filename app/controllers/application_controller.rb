class ApplicationController < ActionController::Base
  protect_from_forgery

  require 'httparty'

  @@last_log_fail = (DateTime.now.to_time.advance(:hours=>-1)).to_datetime

  def sendLog (data)
    if DateTime.now - @@last_log_fail > 1/24.0
      logs = {}
      data.each_with_index do |l, i|
        log = l
        if person_signed_in?
          log[:person_id] = current_person.id
        elsif cookies[:last_user_id]
          log[:unknown_user_details] = cookies[:last_person_id]
        else
          log[:unknown_user_details] = "request.remote_ip: " + request.remote_ip
        end
        logs[i.to_s] = log
      end
      HTTParty.post('http://test.astronomicalproportions.org/interaction_logs/service', :body=>{:logs=>logs, :application=>"CritiSearch"})
    end
  rescue Errno::ECONNREFUSED, Timeout::Error, SocketError
    @@last_log_fail = DateTime.now
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
        if s.person_id? && s.person_id != current_person.id
          #there's already a person
          session.delete(:search_list_id)
          list = SearchList.create
          session[:search_list_id] = list.id
          s = SearchList.find(session[:search_list_id])
        end
        s.person = current_person
        s.save
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
