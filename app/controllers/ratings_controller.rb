class RatingsController < ApplicationController
  def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)
    @rating.user_id = 1
    @rating.save
    redirect_to @rating
  end

  def show
    @rating = Rating.find(params[:id])
  end

  def index
    @ratings = Rating.all
  end

  private
    def rating_params
      params.require(:rating).permit(:restaurant_id, :star, :notes)
    end
end
