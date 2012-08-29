class SessionsController < Devise::SessionsController
  view_paths="app/views/devise"
  before_filter :fake_password, :only => [:create]
  after_filter :resetSession, :only => :destroy
  def new
    resource = build_resource(nil, :unsafe => true)

    # resource.password = request[:first_name]
    logger.debug "\n\n\n\n\n\nexiting new"
    respond_with(resource, serialize_options(resource))
  end

  def create
    logger.debug "enter create"
    # build_resource
    # params[:password] = params[:first_name]
    resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    logger.debug "exit create"
    respond_with resource, :location => after_sign_in_path_for(resource)
  end

  def fake_password
    params[:person][:password] = params[:person][:first_name]
  end

  def resetSession
    reset_session
  end
end 