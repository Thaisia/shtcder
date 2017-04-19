class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render action: 'new'
    end
  end

  private

  def post_params
    current_user == nil ? usr_id = 0 : usr_id = current_user.id
    params.require(:post).permit(:title, :text).merge(user_id:  usr_id)
  end
end
