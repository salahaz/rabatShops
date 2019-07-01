class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    protect_from_forgery with: :exception

    protected

    # Allows for additional custom fields to be passed by the view and the it user coordinates
    # longitude and latitude
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:user, keys: [:longitude, :latitude])
        #devise_parameter_sanitizer.permit(:user, keys: [:longitude, :latitude])
        #devise_parameter_sanitizer.permit(:sign_in, keys: [:longitude, :latitude])
    end


  
end
