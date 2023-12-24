class Publics::HomesController < ApplicationController
  def top
    @posts = Post.all
    @towns = Town.all
    @categories = Category.all
  end
end
