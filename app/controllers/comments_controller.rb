class CommentsController < ApplicationController
  def index
    @comments = Comment.by_descending
  end
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to root_path
    else
      flash.now[:error] = 'Make sure you fill out all the fields!'
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :body)
  end
end
