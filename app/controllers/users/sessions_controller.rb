class Users::SessionsController < Devise::SessionsController
   respond_to :js

  # def new
  #   respond_to do |format|
  #     format.js
  #   end
  # end

  def create
    self.resource = warden.authenticate(auth_options)

    if self.resource
      set_flash_message(:notice, :signed_in) if is_flashing_format?
      sign_in(resource_name, resource)
      yield resource if block_given?
      # respond_with resource, location: after_sign_in_path_for(resource)

      render :js => "window.location = '/'" and return
    else
      # redirect_to login_path, notice: 'Invalid user or email'
      # render :json => {:success => false, :data => resource.errors.full_messages}
      # set_flash_message(:alert, :invalid)
      # render js: flash[:alert], status: 401
      # respond_to :js
      respond_to do |format|
        flash[:notice] = 'Invalid Email or Password'
        format.js {}
        format.html { return login_path}

      end
    end
  end
end
