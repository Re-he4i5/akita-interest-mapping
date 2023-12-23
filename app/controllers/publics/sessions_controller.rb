# frozen_string_literal: true

class Publics::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :user_state, only: [:create]

  def after_sign_out_path_for(resource)
    root_path
  end

  protected
  def user_state
    @user = User.find_by(email: params[:user][:email])
    return if !@user
    if @user.valid_password?(params[:user][:password]) && !@user.is_active
      redirect_to new_user_session_path
    end

  end

end
