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
    @posts = Post.all
    @towns = Town.all
    @categories = Category.all
  end

  def show
  end

  def edit
    @post = Post.find(params[:id])
    @town = Town.find(@post.town_id)
    @towns = Town.all
    @categories = Category.all
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      if Town.find_by(name: @post.town_name)
        town_exist = Town.find_by(name: @post.town_name)
        @post.update(town_id: town_exist.id)
      else
        @post.update(town_id: nil)
      end
      redirect_to user_path(current_user.id)
    else
      @town = Town.find(@post.town_id)
      @towns = Town.all
      @categories = Category.all
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    redirect_to user_path(current_user.id)
  end

  private
  def post_params
    params.require(:post).permit(:image,:town_id,:category_id,:title,:body,:town_name)
  end

end
