class CommentsController < ApplicationController

  before_filter :authenticate_user!, :only =>[:create]

  def create
    @post = Post.find(params[:post_id])
    @post.comments.create({user_id: current_user.id, text: params[:comment]['text'] })
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

end
