class CommentsController < ApplicationController
  before_action :set_location_tour, only: [:create]

  def new

  end

  def edit

  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      if !@tour.nil?
        @tour.comments << @comment
      @comment.participant = current_user
        @comment.save
        redirect_to @tour
      else
        @location.comments << @comment
        @comment.participant = current_user
        @comment.save
        redirect_to(:back)
      end
    else
      flash[:alert] = "Field can not be empty"
      redirect_to(:back)
    end
  end

  def show
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_location_tour
    params[:location_id] ? @location = Location.find(params[:location_id]) : @tour = Tour.find(params[:tour_id])
  end
end
