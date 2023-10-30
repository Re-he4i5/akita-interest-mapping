class Publics::UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
  end

  def update
  end
  
end
