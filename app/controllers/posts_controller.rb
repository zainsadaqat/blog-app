class PostsController < ApplicationController
  def index 
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def new 
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.new(user: @user, title: params[:post][:title], text: params[:post][:text])
    if @post.save!
      flash[:success] = "Successfully created a post!"
      redirect_to posts_path
    else
      flash.now[:error] = "Failed to create a post"
      render 'new'
    end
  end

  def show 
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @like = Like.new
  end
end
