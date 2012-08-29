class LogSenderController < ApplicationController
  require 'net/http'

  @@url = URI.parse("http://localhost:3000/interaction_logs/service")
  @@req = Net::HTTP::Post.new(@@url.path)

  def self.send (data)
  
  # @@req.set_form_data(data)
  # Net::HTTP.start(url.host, url.port) {|http|
  #   http.request(@@req)
  # }
  logger.debug "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
  logger.debug "data"
  logger.debug "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
  end
end
