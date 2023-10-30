# frozen_string_literal: true

class Publics::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  def after_sign_out_path_for(resource)
    root_path
  end

end
