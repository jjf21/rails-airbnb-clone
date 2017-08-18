class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!
  after_action :store_location
  before_action :configure_permitted_parameters, if: :devise_controller?

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    return unless request.get?
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end

  def configure_permitted_parameters
    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :avatar_cache, :avatar_remove, :first_name, :last_name])
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end
end
