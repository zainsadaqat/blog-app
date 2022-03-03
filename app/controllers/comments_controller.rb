class CommentsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
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
      flash[:success] = "Successfully, posted a comment"
      redirect_to comments_path
    else
      flash.now[:error] = "Failed to post a comment"
      render 'new', locals: { comment: @comment }
    end
  end
end
