class Publics::PostsController < ApplicationController
  def new
    @user = current_user
    @towns = Town.all
    @categories = Category.all
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if Town.find_by(name: @post.town_name)
      town = Town.find_by(name: @post.town_name)
      @post.town_id = town.id
    else
      @post.town_id = nil
    end
    @post.user_id = current_user.id
    if @post.save
      redirect_to user_path(current_user.id)
    else
      @user = current_user
      @towns = Town.all
      @categories = Category.all
      render :new
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:image,:town_id,:category_id,:title,:body,:town_name)
  end

end
