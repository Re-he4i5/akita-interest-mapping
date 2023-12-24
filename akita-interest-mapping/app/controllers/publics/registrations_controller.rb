# frozen_string_literal: true

class Publics::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:password,:last_name,:first_name,:last_name_kana,:first_name_kana,:nickname])
  end

end
