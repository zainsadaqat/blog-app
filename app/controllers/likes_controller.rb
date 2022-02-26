class LikesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @like = Like.new(user: @user, post: @post)
    if @like.save
      redirect_to posts_path
    else
      redirect_to posts_path
    end
  end
end
