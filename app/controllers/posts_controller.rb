class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:id])
    @posts = @user.posts
  end

  def show
    @user = User.find_by(id: params[:id])
    @post = Post.find_by(id: params[:id])
  end
end
