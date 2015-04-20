class CommentsController < ApplicationController

  def new
  end

  def edit
  end

  def create
    @tour = Tour.find_by(id: params[:tour_id])
    @comment = Comment.create(comment_params)
    @tour.comments << @comment
    @comment.traveler = current_user
    redirect_to @tour
  end

  def show
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
