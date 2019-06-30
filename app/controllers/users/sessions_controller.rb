# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  attr_accessor :longitude, :latitude
  # GET /resource/sign_in
  # def new
  #   super
  # end
  @@user_latitude = 1.1
  @@user_longitude = 2.0

  # POST /resource/sign_in
  def create
      @@user_longitude = params[:longitude].to_f
      @@user_latitude = params[:latitude].to_f
     super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def self.longitude
    return @@user_longitude
  end

  def self.latitude
    return @@user_latitude
  end
  
  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:longitude, :latitude])
  end

end
