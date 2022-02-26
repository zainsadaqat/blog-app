class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def new
    post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: post } }
    end
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.new(user: @user, title: params[:post][:title], text: params[:post][:text])
    if @post.save
      flash[:success] = "Post saved successfully"
      redirect_to posts_path
    else
      flash.now[:error] = "Post was not saved ..."
      render 'new', locals: { post: @post }
    end
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @post = Post.find_by(id: params[:post_id])
    @like = Like.new
  end
end
