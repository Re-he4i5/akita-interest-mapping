class Publics::UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = current_user
  end

  def update
  end

  def withdraw
    @user = current_user
    @user.update(status: false)
    reset_session
    redirect_to root_path
  end

end
