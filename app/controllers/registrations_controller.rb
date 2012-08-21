class RegistrationsController < Devise::RegistrationsController
  view_paths="app/views/devise"
  def new
    resource = build_resource({})
    resource.email = resource.id_number
    resource.password = request[:first_name]
    resource.password_confirmation = resource.password

    respond_with resource
  end

  def create
    build_resource
    resource.email = resource.id_number
    resource.password = resource.first_name
    resource.password_confirmation = resource.password

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      respond_with resource
    end
  end

  def update
    super
  end
end 