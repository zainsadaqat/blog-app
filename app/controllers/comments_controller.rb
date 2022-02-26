class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
  end

  def new
    @comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: @comment } }
    end
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new(user: @user, post: @post, text: params[:comment][:text])
    if @comment.save
      redirect_to comments_path
    else
      render 'new', locals: { comment: @comment }
    end
  end

  def show; end
end
