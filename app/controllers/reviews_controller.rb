class ReviewsController < ApplicationController
  before_action :set_tour, only: [:create, :edit]
  after_action :set_guiderating, :set_tourrating, only: [:create, :edit]

  def create
    @review = Review.create(review_params)
    # current_user.get_badge
    respond_to do |format|
      if @review.save
        format.html { redirect_to @tour, notice: 'Review was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tour }
      else
        format.html { redirect_to @tour, notice: 'Invalid Review'  }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

private
  def review_params
    params.require(:review).permit(:rating, :content, :tour_id, :participant_id)
  end

  def set_tour
    @tour = Tour.find_by(id: params[:tour_id])
  end

  def set_guiderating
    @tour.guide.guideratings.create(rating: params["review"]["rating"])
    @tour.guide.set_average
  end

  def set_tourrating
    @tour.set_average
  end
end
