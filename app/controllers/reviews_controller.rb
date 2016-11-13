class ReviewsController < ApplicationController
  before_action :authenticate
  PER=10

  def index
    @creator = Creator.find_by(id: params[:creator_id])
    @reviews = @creator.reviews
    @reviews = @reviews.page(params[:page]).per(PER)
  end

  def create
    @creator = Creator.find_by(id: params[:creator_id])
    if @creator.reviews.create(review_params)
      flash[:info] = "review was successfuly wrote!!"
    else
      flash[:warning] = "review sending was failed"
    end
    redirect_to creator_path(@creator)
  end

  private
    def review_params
      params.require(:review).permit(:body, :user_name)
    end
end
