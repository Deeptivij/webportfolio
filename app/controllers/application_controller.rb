class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource)
    redirection_path = root_path

    if devise_mapping.name == :admin
      redirection_path = admin_videos_path
    end
     redirection_path
  end
end
