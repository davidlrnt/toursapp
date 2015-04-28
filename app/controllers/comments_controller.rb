class CommentsController < ApplicationController
  before_action :set_location_tour, only: [:create, :imageupload]
  before_action :set_participant, only: [:create]

  before_action :set_comment, only: [:image_amazon, :imageupload]

  def new

  end

  def edit

  end

  def create
    # binding.pry 
    @comment = @location.comments.new(content: params["content"], participant_id: @user.id)
    if @comment.save
      respond_to do |format|
          format.json { render json: {"status" => "ok", "comment_id" => @comment.id}.to_json }
      end
    else
      # binding.pry
      respond_to do |format|
          format.json { render json: "error".to_json }
      end
    end
    #   if !@tour.nil?
    #     @tour.comments << @comment
    #   @comment.participant = current_user
    #     @comment.save
    #     redirect_to @tour
    #   else
    #     @location.comments << @comment
    #     @comment.participant = current_user
    #     @comment.save
    #     redirect_to(:back)
    #   end
    # else
    #   flash[:alert] = "Field can not be empty"
    #   redirect_to(:back)
    # end
  end

  def image_amazon
    @comment.images.create(image_url: params["key"])
    redirect_to (:back)
  end

  def imageupload
    @commentuploader = Comment.new.image
    @commentuploader.success_action_redirect = "http://localhost:3000/tours/#{@tour.id}/locations/#{@location.id}/comments/#{@comment.id}/image_amazon"
    # binding.pry
  end

  def show
  end

  private
  def set_participant
    @user = current_user
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_location_tour
    # params[:location_id] ? @location = Location.find(params[:location_id]) : @tour = Tour.find(params[:tour_id])
    @location = Location.find_by_id(params[:location_id])
    @tour = Tour.find_by_id(params[:tour_id])
  end

  def set_comment
    @comment = Comment.find_by_id(params["id"])
  end
end
