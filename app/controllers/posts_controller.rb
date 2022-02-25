class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:id])
    @posts = @user.posts
  end

  def new
    new_post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { new_post: new_post } }
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @post = Post.find_by(id: params[:id])
  end
end
