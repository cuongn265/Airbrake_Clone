class Users::SessionsController < Devise::SessionsController
   respond_to :js

  def create
    self.resource = warden.authenticate(auth_options)
    if self.resource
      set_flash_message(:notice, :signed_in) if is_flashing_format?
      sign_in(resource_name, resource)
      yield resource if block_given?
      render :js => "window.location = '/'" and return
    else
      respond_to do |format|
        flash[:notice] = 'Invalid Email or Password'
        format.js
      end
    end
  end
end
