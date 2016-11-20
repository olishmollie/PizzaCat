class RatingsController < ApplicationController
  
  before_filter :authorize

  def new
  end

  def create
    @rating = User.ratings.new(rating_params)
    if @rating.save
      redirect_to @rating
    else
      render plain: "Unable to save rating to database"
    end
  end

  def show
    @rating = Rating.find(params[:id])
  end

  def index
    @user = User.find(session[:user_id])
    @ratings = @user.ratings.all
  end

  private
    def rating_params
      params.require(:rating).permit(:restaurant_id, :star, :notes)
    end
end
