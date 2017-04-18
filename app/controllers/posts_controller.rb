class PostsController < ApplicationController

  def new
  end

  def create
    @post = Post.new(post_params)
    if @post.valid?
      @post.save
      redirect_to @post
    else
      render action: 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
