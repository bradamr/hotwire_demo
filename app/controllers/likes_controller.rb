class LikesController < ApplicationController
  def create
    Like.create(like_params)
    @comment = Comment.find(like_params[:comment_id])

    render 'comments/show'
  end

  private

  def like_params
    params.require(:like).permit(:comment_id)
  end
end
